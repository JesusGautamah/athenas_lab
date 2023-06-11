# frozen_string_literal: true

class CreateBoardProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :board_projects do |t|
      t.integer :chats_count, null: false, default: 0
      t.string :title, null: false
      t.text :description, null: false
      t.string :markdown
      t.string :ipynb

      t.timestamps
    end
  end
end
