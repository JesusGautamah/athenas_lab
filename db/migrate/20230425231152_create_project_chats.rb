# frozen_string_literal: true

class CreateProjectChats < ActiveRecord::Migration[7.0]
  def change
    create_table :project_chats do |t|
      t.references :board_project, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true
      t.string :function_title

      t.timestamps
    end
  end
end
