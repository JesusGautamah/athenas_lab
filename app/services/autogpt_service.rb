# frozen_string_literal: true

# AutogptService
class AutogptService
  def initialize(board_project_id)
    @board_project = BoardProject.find(board_project_id)
    @conductor = Conductor.find_by(board_project: board_project)
    @python_folder = "#{Rails.root}/app/python/"
    @tiktoken = "#{python_folder}tik.py"
    add_actors_to_cast
    @default_memory = Memory.create!(conductor: conductor, content: conductor.config_content, role: "system")
    @steps = board_project.step_count
    @sleep_sec = board_project.sleep_seconds
    @step = 0
  end

  def call
    actors.each_with_index do |actor, index|
      steps.times do |memory_time|
        Rails.logger.debug { "Step: #{memory_time} - Actor: #{actor.inspect}" }
        Rails.logger.debug { "Actor Index: #{index} - Global Step: #{@step}" }
        conductor_memory_process unless @step == 0 && index == 0
        conductor_context_process(actor)
        actor_chat = board_project.chats.find(actor[:chat_id])
        epiphany_instruction = conductor_epiphany_process(actor_chat)

        actor_context_process(actor, epiphany_instruction)
        actor_new_memory_process(actor, actor_chat)
        @step += 1
        conductor.reload
      end
      conductor.memories.where.not(role: "system").destroy_all
    end
  rescue StandardError => e
    Rails.logger.debug e.message
    e.backtrace.each { |line| Rails.logger.debug line }
  end

  private

    attr_reader :board_project, :scene, :tiktoken, :python_folder, :current_actor, :sleep_sec, :steps

    def conductor
      @conductor.reload
    end

    def ai_client
      @ai_client = OpenAI::Client.new(access_token: board_project.owner.openai_key)
    end

    def generate_json_file_path
      "#{python_folder}#{Time.now.to_i}_#{board_project.id}.json"
    end

    def chats
      @chats = board_project.chats.order(:id)
    end

    def actors
      @actors = board_project.chats.order(:id).map do |chat|
        {
          chat_id: chat.id,
          actor_name: chat.actor,
          actor_instructions: chat.prompt,
          memory: [],
          actor_response_count: 0
        }
      end
    end

    def actor_config(instructions)
      {
        role: "system",
        content: instructions
      }
    end

    def request(messages)
      sleep(sleep_sec)
      resp = ai_client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          temperature: 1,
          messages: messages,
          max_tokens: 600
        }
      )
      raise "OpenAI API Error: #{resp["error"]["message"]}" if resp["error"]

      resp.dig("choices", 0, "message")
    rescue StandardError => e
      Rails.logger.debug e.message
      e.backtrace.each { |line| Rails.logger.debug line }
    end

    def add_actors_to_cast
      actors.each do |actor|
        conductor.cast << actor
      end
    end

    def max_tokens_reached?(json_file)
      !system("python3 #{Rails.root}/app/python/tik.py #{json_file}")
    end

    def conductor_memory_process
      old_memory = conductor.memories.last(2).map { |mem| mem.role == "user" ? "\nresponse: #{mem.content}" : "\nquestion: #{mem.content}" }

      text = generate_small_text(old_memory)

      unless Submemory.find_by(title: text["title"], conductor: conductor)
        Submemory.create!(conductor: conductor, title: text["title"], content: text["description"], step: @step, step_context: "conductor_memory_process")
      end
      memory = "This is your memory, so remember that you already: \n#{text["title"]}\n#{text["description"]}"
      Memory.create!(conductor: conductor, content: memory, role: "system", step_context: "conductor_memory_process")
    end

    def conductor_context_process(actor)
      message = conductor.generate_instructions(actor[:actor_name])
      Memory.create!(conductor: conductor, content: message[:content], role: "user", step_context: "conductor_context_process")
    end

    def generate_small_text(old_memory)
      sleep(sleep_sec)
      return "NO MESSAGES" if old_memory.blank?

      req = { role: "user", content: "generate a small description to be added as a kanban already done card title: \n#{old_memory.join("\n")}
      \nreturn me this kanban card in a json, do not send nothing else, do not add invalid characters to json parsing,\n
      the description has to be a report resume of the conclusion in the response, do not send ' or `, this json has to be like {title:, description:}" }
      generated_text = ai_client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          temperature: 1,
          messages: [req],
          max_tokens: 600
        }
      ).dig("choices", 0, "message", "content").to_s
      JSON.parse(generated_text)
    rescue JSON::ParserError
      JSON.parse([generated_text].to_json).second
    end

    def conductor_epiphany_process(actor_chat)
      memories = conductor.memories.map { |mem| { role: mem.role, content: mem.content }	}
      memories.each { |mem| Rails.logger.debug mem.inspect }
      epiphany = request(memories).map { |k, v| { k.to_sym => v } }.reduce({}, :merge)
      Message.create!(content: epiphany[:content], chat: actor_chat, role: :athenas_ai)
      @new_conductor_memory = Memory.create!(conductor: conductor, content: epiphany[:content], role: "assistant", step_context: "conductor_epiphany_process")
      epiphany[:role] = "user"
      epiphany
    end

    def actor_context_process(actor, new_memory)
      actor[:memory] << actor_config(actor[:actor_instructions])
      actor[:memory] << new_memory
    end

    def actor_new_memory_process(actor, actor_chat)
      actor_memory = request(actor[:memory]).map { |k, v| { k.to_sym => v } }.reduce({}, :merge)
      Message.create!(content: actor_memory[:content], chat: actor_chat, role: :actor)
      actor[:memory] << actor_memory
      @new_actor_memory = Memory.create!(conductor: conductor, content: actor_memory[:content], role: "user", step_context: "actor_new_memory_process")
      actor[:actor_response_count] += 1
    end
end
