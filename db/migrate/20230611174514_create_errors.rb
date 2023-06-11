class CreateErrors < ActiveRecord::Migration[7.0]
  def change
    create_table :errors do |t|
      t.integer :chat_id
      t.integer :user_id
      t.text :message
      t.text :backtrace, array: true, default: []

      t.timestamps
    end
  end
end
