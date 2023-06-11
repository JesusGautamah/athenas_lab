# frozen_string_literal: true

class CreateGenImages < ActiveRecord::Migration[7.0]
  def change
    create_table :gen_images do |t|
      t.references :message, null: false, foreign_key: true
      t.text :gen_url, null: false

      t.timestamps
    end
  end
end
