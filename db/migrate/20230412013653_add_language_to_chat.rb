# frozen_string_literal: true

class AddLanguageToChat < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :language, :string
  end
end
