class CreateHermetics < ActiveRecord::Migration[7.0]
  def change
    create_table :hermetics do |t|
      t.text :laws, array: true, default: []
      t.references :scene, null: false, foreign_key: true

      t.timestamps
    end
  end
end
