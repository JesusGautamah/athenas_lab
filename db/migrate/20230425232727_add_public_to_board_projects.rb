# frozen_string_literal: true

class AddPublicToBoardProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :board_projects, :public, :boolean
  end
end
