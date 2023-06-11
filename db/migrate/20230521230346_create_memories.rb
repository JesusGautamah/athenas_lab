class CreateMemories < ActiveRecord::Migration[7.0]
  def change
    create_table :memories do |t|
      t.references :conductor, null: false, foreign_key: true
      t.text :content
      t.string :role

      t.timestamps
    end
  end
end
