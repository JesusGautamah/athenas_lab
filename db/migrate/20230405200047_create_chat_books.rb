# frozen_string_literal: true

class CreateChatBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_books do |t|
      t.references :chat, null: false, foreign_key: true
      t.text :title, null: false
      t.text :description, default: "NOT DEFINED", null: false
      t.text :author, default: "NOT REGISTERED", null: false
      t.integer :year

      t.timestamps
    end
  end
end
