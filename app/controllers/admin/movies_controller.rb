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
        else
            flash[:alert] = "更新に失敗しました"
            render :edit, status: 400
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy

        flash[:notice] = @movie.name + "を削除しました。"

        redirect_to admin_movies_path()
    end

    private
        def movie_params
            params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
        end
end