# frozen_string_literal: true

class CreateCodeExplanations < ActiveRecord::Migration[7.0]
  def change
    create_table :code_explanations do |t|
      t.text :title
      t.references :message, null: false, foreign_key: true
      t.text :description, null: false
      t.text :code, null: false
      t.text :explanation, null: false

      t.timestamps
    end
  end
end
