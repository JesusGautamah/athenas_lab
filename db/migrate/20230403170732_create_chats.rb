class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0, null: false
      t.string :title, default: "", null: false, limit: 100

      t.timestamps
    end
  end
end
