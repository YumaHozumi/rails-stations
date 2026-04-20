class Admin::ReservationsController < ApplicationController
    def index
        @reservations = Reservation.all
    end

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        begin
            if @reservation.save
                redirect_to
            else
                flash[:alert] = "登録に失敗しました。"
                redirect_to admin_reservations_path, status: 400
            end
        rescue ActiveRecord::RecordNotUnique
            flash[:alert] = "⚠️すでに予約されている座席です"
            redirect_to admin_reservations_path, status: 400
        end
    end

    def show
        @reservation = Reservation.find(params[:id])
    end

    def update
        @reservation = Reservation.find(params[:id])

        begin
            if @reservation.update(reservation_params)
                redirect_to admin_reservations_path
            else
                render :show, status: 400
            end
        rescue ActiveRecord::RecordNotUnique
            puts "koko"
            render :show, status: 400
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy

        redirect_to admin_reservations_path
    end

    private 
        def reservation_params
            params.require(:reservation).permit(:name, :email, :schedule_id, :sheet_id, :date)
        end
end