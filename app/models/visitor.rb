# frozen_string_literal: true

class Visitor < ApplicationRecord
  validates :name, presence: true
  validates :platform, presence: true
  enum platform: { telegram: 0, discord: 1 }

  def tel_user
    User.find_by(telegram_id: telegram_id)
  end

  def dis_user
    User.find_by(discord_id: discord_id)
  end
end
