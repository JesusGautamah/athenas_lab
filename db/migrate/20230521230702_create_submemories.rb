class CreateSubmemories < ActiveRecord::Migration[7.0]
  def change
    create_table :submemories do |t|
      t.references :conductor, null: false, foreign_key: true
      t.text :step_context
      t.text :content
      t.integer :step

      t.timestamps
    end
  end
end
