# frozen_string_literal: true

class Chat < ApplicationRecord
  belongs_to :user
  validates :actor, presence: true
  has_many :messages, dependent: :destroy
  before_save :load_prompt
  after_create :first_message
  before_update :load_prompt
  enum status: { open: 0, closed: 1 }

  def load_prompt
    self.prompt = AwesomeChatgptActors::Actor.new(role: actor, language: "pt").prompt
  end

  def first_message
    actor = AwesomeChatgptActors::Actor.new(role: self.actor, language: "pt")
    self.prompt = actor.with_language(language).prompt
    message = Message.new(content: prompt, role: "user")
    message.chat = self
    message.save
  end
end
