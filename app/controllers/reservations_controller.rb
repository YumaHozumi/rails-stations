class ReservationsController < ApplicationController
    def index

    end

    def new
        @reservation = Reservation.new

        if !params[:date].presence or !params[:sheet_id].presence
            redirect_to
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)

        if @reservation.save
            redirect_to movies_path()
        else
            redirect_to new_movie_schedule_reservation_path(params[:movie_id], params[:schedule_id]), status: :unprocessable_entity
        end
    end

    private
        def reservation_params
            params.require(:reservation).permit(:sheet_id, :schedule_id, :name, :email, :date)
        end
end
