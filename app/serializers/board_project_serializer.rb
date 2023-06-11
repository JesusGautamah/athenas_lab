class BoardProjectSerializer < ActiveModel::Serializer
  attributes :title, :description, :owner

  has_many :chats
end
