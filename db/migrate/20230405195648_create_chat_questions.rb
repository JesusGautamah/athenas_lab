# frozen_string_literal: true

class CreateChatQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_questions do |t|
      t.references :chat, null: false, foreign_key: true
      t.text :question, null: false
      t.text :answers, null: false

      t.timestamps
    end
  end
end
