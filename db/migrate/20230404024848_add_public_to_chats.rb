# frozen_string_literal: true

class AddPublicToChats < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :public, :boolean, default: false, null: false
  end
end
