class CreateScenes < ActiveRecord::Migration[7.0]
  def change
    create_table :scenes do |t|
      t.text :past_points, array: true, default: []
      t.text :initial_point
      t.text :actual_point
      t.text :objective_point
      t.references :board_project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
