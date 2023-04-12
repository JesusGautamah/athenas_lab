# frozen_string_literal: true

class CreateGenSpreadsheets < ActiveRecord::Migration[7.0]
  def change
    create_table :gen_spreadsheets do |t|
      t.text :title, null: false
      t.references :message, null: false, foreign_key: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
