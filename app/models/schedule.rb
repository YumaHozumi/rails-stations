require "time"

class Schedule < ApplicationRecord
    belongs_to :movie
    has_many :reservations

    def format_time(time)
        return time.strftime('%H:%M')
    end

    def showing_time
        return "#{format_time(self.start_time)} 〜 #{format_time(self.end_time)}"
    end

    def available_sheets(date)
        @reservations = self.reservations.where(date: date)
        @sheets = Sheet.all
        @reserved_sheets = @reservations.map do | reservation |
            reservation.sheet
        end
        return @sheets - @reserved_sheets
    end
end
