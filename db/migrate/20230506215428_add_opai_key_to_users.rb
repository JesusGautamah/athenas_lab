class AddOpaiKeyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :openai_key, :string
  end
end
