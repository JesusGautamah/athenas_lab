class Scene < ApplicationRecord
  belongs_to :board_project
  has_one :hermetic, dependent: :destroy, inverse_of: :scene
end
