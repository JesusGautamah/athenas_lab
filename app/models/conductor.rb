# frozen_string_literal: true

# Conductor Model
class Conductor < ApplicationRecord
  belongs_to :board_project
  belongs_to :scene
  before_create :load_config
  has_many :memories, dependent: :destroy
  has_many :submemories, dependent: :destroy

  def load_config
    system_config = {
          role: "system",
          content: "Help for the #{board_project.title}.
          Your objective is to reach #{scene.objective_point}.
          Send only one instruction step per request and use the format:
          'Hey {Actor Name}, can you please {what u want to know or help with}?'"
        }

    self.system_config = system_config
  end

  def config_content
    "Help for the #{board_project.title}.\n
    Your objective is to reach #{scene.objective_point}.\n
    You will have memories after the conversation start, use them to help you.\n
    Do not send question or instructions that you already did and do not send anything else, just the instructions(or question).\n
    If he ask you something, you can answer him with the information that you have.\n
    Send only one instruction step per request and use the format: '{Actor Name}, can you please {what u want to know or help with}?'"
  end

  def generate_instructions(actor_name)
    {
      role: "user",
      content: "Send instructions to the actor: #{actor_name}\n
                Now you are speaking with #{actor_name}, you can ask him to do something or ask him something.\n
                If he ask you something, you can answer him with the information that you have.\n
                Remember to follow your instructions and send only one instruction step per request and use the format: '{actor}, can you please {what u want to know or help with}?'
                If you have to send him information, use the format: '{actor}, {information}'\n"
    }
  end
end
