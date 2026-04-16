class ReservationsController < ApplicationController
    def new
        
    end

    def create
        puts reservation_params
    end

    private
        def reservation_params
            params.require(:reservation).permit(:sheet_id, :schedule_id, :name, :email, :date)
        end
end
