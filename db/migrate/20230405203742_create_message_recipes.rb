# frozen_string_literal: true

class CreateMessageRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :message_recipes do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.references :message, null: false, foreign_key: true
      t.text :content, null: false
      t.text :steps, null: false

      t.timestamps
    end
  end
end
