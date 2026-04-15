class Admin::SchedulesController < ApplicationController
    def index
        @movie = Movie.find(params[:movie_id])
        @schedules = @movie.schedules
    end

    def show
        
    end

    def new
        @schedule = Schedule.new
    end

    def create
        @schedule = Schedule.new(schedule_params)
        @schedule.movie_id = params[:movie_id]

        if @schedule.save
            redirect_to
        else
            redirect_to action: "new", status: :unprocessable_entity
        end
    end

    def edit
        @schedule = Schedule.find(params[:id])
        @movie = Movie.find(params[:movie_id])
    end

    def update
        @schedule = Schedule.find(params[:id])
        if @schedule.update(schedule_params)
            redirect_to admin_movie_schedules_path(params[:movie_id])
        else
            flash[:alert] = "更新に失敗しました"
            render :edit, status: 400
        end
    end

    def destroy
        @schedule = Schedule.find(params[:id])
        @schedule.destroy

        flash[:notice] = "削除しました。"

        redirect_to admin_movie_schedules_path(params[:movie_id])
    end

    private
        def schedule_params
            params.require(:schedule).permit(:start_time, :end_time)
        end
end
