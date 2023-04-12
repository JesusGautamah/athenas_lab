# frozen_string_literal: true

class CreateMessageCorrections < ActiveRecord::Migration[7.0]
  def change
    create_table :message_corrections do |t|
      t.references :message, null: false, foreign_key: true
      t.text :description, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
