# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :chat
  enum role: { user: 0, assistant: 1, actor: 2, system: 3, athenas_ai: 4 }
  has_many :gen_images, dependent: :destroy
  has_many :message_corrections, dependent: :destroy
  before_save :markdown_message
  after_create_commit :broadcast_message
  after_create_commit :broadcast_to_board_project_if_exists

  include ActionView::Helpers
  include ApplicationHelper

  def markdown_message
    self.markdown = message_markdown(content)
  end

  def broadcast_message
    ActionCable.server.broadcast("chat_#{chat.id}_channel", { messages: [self] })
  end

  def broadcast_to_board_project_if_exists
    if chat.board_projects.count.positive?
      chat.board_projects.each do |board_project|
        project_chats = board_project.chats
        chats_with_messages = project_chats.map { |project_chat| { chat: project_chat, messages: project_chat.messages.last(5) } }
        ActionCable.server.broadcast("board_project_#{board_project.id}_channel", { chats: chats_with_messages })
      end
    end
  end

  def catch_keywords
    keywords = openai_service.extract_keywords(content)
    chat = self.chat
    chat.keywords += keywords
    if chat.save
      self.keywords = keywords
      save ? true : false
    else
      false
    end
  end

  def generate_image
    return false if gen_images.count > 5

    image = openai_service.generate_image(content)
    image = GenImage.new(message_id: id, gen_url: image)
    image.save ? true : false
  end

  def correct_grammar
    return false if message_corrections.any?

    corrected = openai_service.grammar_correction(content)
    corrected = MessageCorrection.new(message_id: id, description: "Grammar Correction", content: corrected)
    corrected.save ? true : false
  end

  def generate_questions
    return false if message_questions.count > 5

    questions = openai_service.generate_questions(content)
    questions = MessageQuestion.new(message_id: id, description: "Question Generation", content: questions)
    questions.save ? true : false
  end

  delegate :user, to: :chat

  private

    def openai_service
      OpenaiService.new(user.openai_key)
    end
end
