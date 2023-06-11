# frozen_string_literal: true

class AddKeywordsToMessagesAndChats < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :keywords, :text, array: true, default: []
    add_column :chats, :keywords, :text, array: true, default: []
  end
end
