# frozen_string_literal: true

class CreateChatSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_summaries do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.text :content, null: false
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
