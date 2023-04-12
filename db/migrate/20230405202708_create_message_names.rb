# frozen_string_literal: true

class CreateMessageNames < ActiveRecord::Migration[7.0]
  def change
    create_table :message_names do |t|
      t.text :name, null: false, default: [], array: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
