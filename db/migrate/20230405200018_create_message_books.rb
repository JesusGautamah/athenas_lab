# frozen_string_literal: true

class CreateMessageBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :message_books do |t|
      t.references :message, null: false, foreign_key: true
      t.text :title, null: false
      t.text :description, default: "NOT DEFINED", null: false
      t.text :author, default: "NOT REGISTERED", null: false
      t.integer :year

      t.timestamps
    end
  end
end
