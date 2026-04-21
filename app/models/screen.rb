class Screen < ApplicationRecord
  has_many :schedules
  has_many :sheets
end
