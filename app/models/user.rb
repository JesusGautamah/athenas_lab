class User < ApplicationRecord
  before_update :generate_password_salt
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :chats

  def generate_password_salt
    return if password_hash.blank? || password_hash.nil?
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password_hash, password_salt)
  end
end
