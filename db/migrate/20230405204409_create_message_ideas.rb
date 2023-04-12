# frozen_string_literal: true

class CreateMessageIdeas < ActiveRecord::Migration[7.0]
  def change
    create_table :message_ideas do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.references :message, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
