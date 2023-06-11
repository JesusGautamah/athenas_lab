class CreateConductors < ActiveRecord::Migration[7.0]
  def change
    create_table :conductors do |t|
      t.references :board_project, null: false, foreign_key: true
      # t.text :memory, array: true, default: []
      t.text :cast, array: true, default: []
      t.references :scene, null: false, foreign_key: true
      # t.text :subconcious, array: true, default: []
      t.text :system_config

      t.timestamps
    end
  end
end
