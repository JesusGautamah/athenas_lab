class MessageSerializer < ActiveModel::Serializer
  attributes :content, :role, :markdown
end
