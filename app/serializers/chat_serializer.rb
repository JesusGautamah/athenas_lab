class ChatSerializer < ActiveModel::Serializer
  attributes :status, :title, :prompt, :actor

  has_many :messages
end
