class AddMarkdownToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :markdown, :text
  end
end
