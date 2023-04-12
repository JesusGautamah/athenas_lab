# frozen_string_literal: true

class CreateParsedSctructures < ActiveRecord::Migration[7.0]
  def change
    create_table :parsed_sctructures do |t|
      t.references :message, null: false, foreign_key: true
      t.text :title, null: false
      t.text :description, null: false
      t.text :gen_structure, null: false

      t.timestamps
    end
  end
end
