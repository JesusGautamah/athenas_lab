# frozen_string_literal: true

# AutogptService
class AutogptService
  def initialize(board_project_id)
    @board_project = BoardProject.find(board_project_id)
    @scene = Scene.new(board_project.description)
    @conductor = Conductor.new(board_project_id)
  end

  def call
  end

  private

    attr_reader :board_project

    def ai_client
      @ai_client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY", nil))
    end

    def chats
      @chats = board_project.chats.order(:id)
    end

    def actors
      @actors = board_project.chats.order(:id).map do |chat|
        {
          actor_name: chat.actor,
          actor_instructions: chat.prompt,
          actor_response_count: 0
        }
      end
    end

    def script
      @script = {
        scene: scene,
        conductor: conductor,
        actors: actors
      }
    end

    def conductor_message_format(instant_message)
      {
        role: "user",
        content: instant_message
      }
    end

    def actor_config(instructions)
      {
        role: "system",
        content: instructions
      }
    end

    # this will contain all the messages, so each actor has a single chat with the conductor,
    # and the central memmory is who record all the messages as one chat
    def central_memory
      @central_memory = []
    end

    def request(messages)
      ai_client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          temperature: 0.9,
          messages: messages,
        }
      )
    end

    def run
      # so in the process we have to create a loop through the actors,
      # let's start with 5 times, and then loop through the actors
      @central_memory << conductor_message_format(conductor.system_config[:content])
      5.times do
        
        actors.each do |actor|
          # first send the intructions to the conductor, because it has to know what to do



end
