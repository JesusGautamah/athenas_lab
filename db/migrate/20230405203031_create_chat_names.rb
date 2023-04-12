# frozen_string_literal: true

class CreateChatNames < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_names do |t|
      t.text :name, null: false, default: [], array: true
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
