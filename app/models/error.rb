# frozen_string_literal: true

class Error < ApplicationRecord
  validates :message, presence: true
  validates :backtrace, presence: true
end
