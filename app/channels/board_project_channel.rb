# frozen_string_literal: true

class BoardProjectChannel < ApplicationCable::Channel
  def subscribed
    board_project = BoardProject.find(params[:board_project_id])
    if board_project && board_project.owner == current_user
      stream_from "board_project_#{params[:board_project_id]}_channel"
    else
      reject
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def fetch_chats(data)
    chats = BoardProject.find(data["board_project_id"]).chats
    chats_with_messages = chats.map { |chat| { chat: chat, messages: chat.messages.last(5) } }
    ActionCable.server.broadcast("board_project_#{data["board_project_id"]}_channel", { chats: chats_with_messages })
  end
end
