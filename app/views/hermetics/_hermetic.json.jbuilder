# frozen_string_literal: true

json.extract! hermetic, :id, :laws, :created_at, :updated_at
json.url hermetic_url(hermetic, format: :json)
