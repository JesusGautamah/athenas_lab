# frozen_string_literal: true

class ProjectChat < ApplicationRecord
  validate :board_already_has_chat?
  belongs_to :board_project
  belongs_to :chat
  after_save :update_board_chats_count

  def board_already_has_chat?
    return unless board_project.chats.include?(chat)

    errors.add(:chat, "already exists in this board")
  end

  def update_board_chats_count
    board_project.chats_count += 1
    board_project.save
  end
end
