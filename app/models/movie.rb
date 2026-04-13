class Movie < ApplicationRecord
    def index
        @movies = Movie.all
    end
end