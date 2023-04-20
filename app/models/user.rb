# frozen_string_literal: true

class User < ApplicationRecord
  before_update :generate_password_salt
  before_update :attach_avatar
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chats, dependent: :destroy

  has_one_attached :avatar

  attr_accessor :avatar_param

  def attach_avatar
    return if avatar_param.blank?

    avatar.attach(avatar_param)
  end

  def generate_password_salt
    return if password_hash.blank? || password_hash.nil?

    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password_hash, password_salt)
  end
end
