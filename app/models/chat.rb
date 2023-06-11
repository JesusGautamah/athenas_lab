# frozen_string_literal: true

class Chat < ApplicationRecord
  belongs_to :user
  validates :actor, presence: true
  validates :title, uniqueness: { scope: :user_id }
  has_many :messages, dependent: :destroy
  has_many :project_chats, dependent: :destroy
  has_many :board_projects, through: :project_chats
  before_save :load_prompt
  # after_create :first_message
  before_update :load_prompt
  enum status: { open: 0, closed: 1 }

  def load_prompt
    self.prompt = AwesomeChatgptActors::Actor.new(role: actor, language: "pt").prompt
  end

  def first_message
    return if actor == "No Config"

    actor = AwesomeChatgptActors::Actor.new(role: self.actor, language: "pt")
    message = Message.new(content: actor.prompt, role: "user")
    message.chat = self
    message.save
  end
end
