# frozen_string_literal: true

# BoardProject model
class BoardProject < ApplicationRecord
  belongs_to :owner, class_name: "User", inverse_of: :board_projects

  has_many :board_project_users, dependent: :destroy, inverse_of: :board_project
  has_many :users, through: :board_project_users

  has_many :project_chats, dependent: :destroy, inverse_of: :board_project
  has_many :chats, through: :project_chats

  def cast_actors
    chats.map(&:actor)
  end
end
