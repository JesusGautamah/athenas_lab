# frozen_string_literal: true

class AddFilesDisplayOrderToBoardProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :board_projects, :file_display_order, :string
  end
end
