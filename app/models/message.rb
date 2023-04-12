# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :chat
  enum role: { user: 0, assistant: 1 }
  has_many :gen_images, dependent: :destroy
  has_many :message_corrections, dependent: :destroy

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

  def user
    chat.user
  end

  private

    def openai_service
      OpenaiService.new
    end
end
