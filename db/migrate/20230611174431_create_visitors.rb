class CreateVisitors < ActiveRecord::Migration[7.0]
  def change
    create_table :visitors do |t|
      t.string :telgram_id
      t.string :discord_id
      t.integer :platform
      t.string :name
      t.integer :current_user_id

      t.timestamps
    end
  end
end
