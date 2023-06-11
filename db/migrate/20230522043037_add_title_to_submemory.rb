class AddTitleToSubmemory < ActiveRecord::Migration[7.0]
  def change
    add_column :submemories, :title, :text
  end
end
