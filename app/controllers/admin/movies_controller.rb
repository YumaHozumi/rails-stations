class Admin::MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def new
        #  modelのインスタンス作成
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        
        if Movie.exists?(name: @movie.name)
            flash[:alert] = "すでに同じタイトルの映画が登録されてます。"

            render :new, status: 400
        else
            if @movie.save
                redirect_to
            else
                redirect_to action "new", status: :unprocessable_entity
            end
        end
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def edit
        @movie = Movie.find(params[:id])
    end 

    def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
            redirect_to
        
        end
    end

    private
        def movie_params
            params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
        end
end