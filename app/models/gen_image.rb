# frozen_string_literal: true

class GenImage < ApplicationRecord
  belongs_to :message
  validates :gen_url, presence: true
  has_one_attached :gen_image
  after_create :attach_image

  def attach_image
    faraday_client = Faraday.new(url: gen_url)

    response = faraday_client.get do |req|
      req.headers["Content-Type"] = "application/json"
      req.headers["Accept"] = "application/json"
    end
    image_io = StringIO.new(response.body)

    gen_image.attach(io: image_io, filename: "#{message_id}.png")
  end
end
