require "time"

class Schedule < ApplicationRecord
    belongs_to :movie

    def format_time(time)
        return time.strftime('%H:%M')
    end

    def showing_time
        return "#{format_time(self.start_time)} 〜 #{format_time(self.end_time)}"
    end
end
