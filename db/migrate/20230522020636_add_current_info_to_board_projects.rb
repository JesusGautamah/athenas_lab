class AddCurrentInfoToBoardProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :board_projects, :current_step_count, :integer
    add_column :board_projects, :current_step_context, :text
  end
end
