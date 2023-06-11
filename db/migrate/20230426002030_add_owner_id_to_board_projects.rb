# frozen_string_literal: true

class AddOwnerIdToBoardProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :board_projects, :owner_id, :integer
  end
end
