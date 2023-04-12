# frozen_string_literal: true

class CreateMessageQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :message_questions do |t|
      t.references :message, null: false, foreign_key: true
      t.text :question, null: false
      t.text :answers, null: false

      t.timestamps
    end
  end
end
