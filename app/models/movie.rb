class Movie < ApplicationRecord
    validates :name, uniqueness: true

    has_many :schedules
end