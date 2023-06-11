# frozen_string_literal: true

class AddActorToChat < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :actor, :string
    add_column :chats, :prompt, :text
  end
end
