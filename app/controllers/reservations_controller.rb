class ReservationsController < ApplicationController
  def index; end

  def new
    @reservation = Reservation.new

    return unless !params[:date].presence or !params[:sheet_id].presence

    redirect_to
  end

  def create
    @reservation = Reservation.new(reservation_params)
    begin
      if @reservation.save
        redirect_to movies_path
      else
        redirect_to reservation_movie_path(
          reservation_params[:movie_id],
          date: reservation_params[:date],
          schedule_id: reservation_params[:schedule_id]
        )
      end
    rescue ActiveRecord::RecordNotUnique
      redirect_to reservation_movie_path(
        reservation_params[:movie_id],
        date: reservation_params[:date],
        schedule_id: reservation_params[:schedule_id]
      )
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:sheet_id, :schedule_id, :name, :email, :date)
  end
end
