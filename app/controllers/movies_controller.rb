class MoviesController < ApplicationController
  def index
    keyword = params[:keyword]
    is_showing = params[:is_showing]

    @movies = if keyword.present?
      # 部分一致
      Movie.where('name LIKE?', "%#{keyword}%").or(Movie.where('description LIKE?', "%#{keyword}%"))
    elsif is_showing == 'showing'
        Movie.where(is_showing: 1)
    elsif is_showing == 'scheduled'
       Movie.where(is_showing: 0)
    else
        Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
  end

  def reservation
    if !params[:date].present? || !params[:schedule_id].present?
      redirect_to movie_path(params[:id])
    else
      @row_sheets = Sheet.order(:row, :column).group_by(&:row)
      @schedule = Schedule.find(params[:schedule_id])
      @sheets = Sheet.all
      @column_num = @row_sheets.first[1].length
      @available_sheets = @schedule.available_sheets(params[:date])
    end
  end
end
