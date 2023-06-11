# frozen_string_literal: true

# BoardProject model
class BoardProject < ApplicationRecord
  before_create :markdown_attach
  after_create :generate_scenario
  before_update :markdown_attach
  belongs_to :owner, class_name: "User", inverse_of: :board_projects

  has_one :conductor, dependent: :destroy, inverse_of: :board_project

  has_many :project_users, dependent: :destroy, inverse_of: :board_project
  has_many :users, through: :project_users

  has_many :project_chats, dependent: :destroy, inverse_of: :board_project
  has_many :chats, through: :project_chats
  has_one :scene, dependent: :destroy, inverse_of: :board_project

  has_one_attached :md_file

  attr_accessor :markdown_params

  def markdown_attach
    return if markdown_params.blank?

    md_file.attach(markdown_params)
  end

  def system_memories
    memories.where(role: "system")
  end

  def generate_scenario
    ai_client = OpenAI::Client.new(access_token: owner.openai_key)
    message = "Generate a development scenario for the project #{title}.
               return this response in json format { scenario_objective, scenario_initial_point }
               do not send anything else, just this json response
              "
    messages = [{
      role: "user",
      content: message
    }]
    response = ai_client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        temperature: 0.9,
        messages: messages,
        max_tokens: 600
      }
    )

    scenario = JSON.parse(response.dig("choices", 0, "message", "content"))

    scene = Scene.create(objective_point: scenario["scenario_objective"],
                         initial_point: scenario["scenario_initial_point"],
                         board_project: self)
    hermetics = "generate seven steps considering the seven hermetic laws to reach the objective point #{scenario["scenario_objective"]}
                 return this in a json { first_law, second_law, third_law, fourth_law, fifth_law, sixth_law, seventh_law }
                 do not send anything else, just this json response
                  "
    messages = [{ role: "user", content: hermetics }]
    response = ai_client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        temperature: 0.9,
        messages: messages,
        max_tokens: 600
      }
    )
    hermetics = JSON.parse(response.dig("choices", 0, "message", "content"))
    laws = []
    hermetics.each do |_key, value|
      laws << value
    end
    Hermetic.create(laws: laws, scene: scene)

    Conductor.create(board_project: self, scene: scene)
  end

  def cast_actors
    chats.map(&:actor)
  end
end
