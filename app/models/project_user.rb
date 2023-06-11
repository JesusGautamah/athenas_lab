# frozen_string_literal: true

class ProjectUser < ApplicationRecord
  belongs_to :board_project
  belongs_to :user

  enum role: { owner: 0, member: 1, guest: 2, admin: 3, bot: 4 }
end
