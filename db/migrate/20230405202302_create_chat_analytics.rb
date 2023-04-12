# frozen_string_literal: true

class CreateChatAnalytics < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_analytics do |t|
      t.references :chat, null: false, foreign_key: true
      t.text :title, null: false
      t.text :description, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
