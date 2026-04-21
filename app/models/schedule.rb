require 'time'

class Schedule < ApplicationRecord
  belongs_to :movie
  belongs_to :screen
  has_many :reservations

  def format_time(time)
    time.strftime('%H:%M')
  end

  def showing_time
    "#{format_time(start_time)} 〜 #{format_time(end_time)}"
  end

  def available_sheets(date)
    @reservations = reservations.where(date: date)
    @sheets = Sheet.all
    @reserved_sheets = @reservations.map do |reservation|
      reservation.sheet
    end
    @sheets - @reserved_sheets
  end
end
