# frozen_string_literal: true

require "will_paginate/array"

class ChatChannel < ApplicationCable::Channel
  # include ActionView::Helpers

  def subscribed
    chat = Chat.find(params[:chat_id])
    if chat && chat.user == current_user
      stream_from "chat_#{params[:chat_id]}_channel"
    else
      reject
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def fetch_chat_messages(data)
    chat_id = data["chat_id"]
    if (chat = Chat.find(chat_id))
      messages = chat.messages.order(:id).paginate(page: data["page"], per_page: 5)
      ActionCable.server.broadcast("chat_#{chat_id}_channel", html(messages))
    else
      ActionCable.server.broadcast("chat_channel", { error: "Chat not found" })
    end
  end

  def html(messages)
    ChatsController.render(
      partial: "chats/chat_messages",
      locals: { messages: messages, user: current_user.id }
    )
  end
end
