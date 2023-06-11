# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.integer :role, default: 0, null: false
      t.text :content, default: "", null: false

      t.timestamps
    end
  end
end
