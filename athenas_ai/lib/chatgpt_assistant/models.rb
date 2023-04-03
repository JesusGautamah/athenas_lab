# frozen_string_literal: true

require "active_record"

# User model
class User < ActiveRecord::Base
  has_many :chats

  def current_chat
    chats.find(current_chat_id)
  end

  def last_chat
    chats.last
  end

  def chat_by_title
    chats.find_by(title: title)
  end
end

# Chat model
class Chat < ActiveRecord::Base
  validates :user_id, presence: true
  validates :status, presence: true
  validates :title, presence: true, uniqueness: true

  belongs_to :user
  has_many :messages
end

# Message model
class Message < ActiveRecord::Base
  validates :content, presence: true
  enum role: { user: 0, assistant: 1 }

  belongs_to :chat
end
