class Sheet < ApplicationRecord
  has_one :reservation
  belongs_to :screen
end
