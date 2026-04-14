class Movie < ApplicationRecord
    validates :name, uniqueness: true

    def index
        @movies = Movie.all
    end
end