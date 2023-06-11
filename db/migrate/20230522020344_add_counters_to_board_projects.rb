class AddCountersToBoardProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :board_projects, :step_count, :integer
    add_column :board_projects, :sleep_seconds, :integer
  end
end
