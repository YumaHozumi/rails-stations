class MoviesController < ApplicationController
    def index
        keyword = params[:keyword]
        is_showing = params[:is_showing]
        @movies = Movie.all
        
        if keyword.present?
            # 部分一致
            @movies = @movies.where("name LIKE?", "%#{keyword}%").or(Movie.where("description LIKE?", "%#{keyword}%"))
        end

        if is_showing == "showing"
            @movies = @movies.where(is_showing: 1)
        elsif is_showing == "scheduled"
            @movies = @movies.where(is_showing: 0)
        end
    end

    def show
        @movie = Movie.find(params[:id])
        @schedules = @movie.schedules
    end
end