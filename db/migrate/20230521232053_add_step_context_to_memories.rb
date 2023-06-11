class AddStepContextToMemories < ActiveRecord::Migration[7.0]
  def change
    add_column :memories, :step_context, :text
  end
end
