require "time"

class Schedule < ApplicationRecord
    belongs_to :movie

    def format_time(time)
        return time.strftime('%Y年%m月%d日 %H:%M:%S')
    end
end
