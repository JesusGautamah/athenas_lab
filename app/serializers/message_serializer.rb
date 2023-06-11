# frozen_string_literal: true

class MessageSerializer < ActiveModel::Serializer
  attributes :content, :role, :markdown
end
