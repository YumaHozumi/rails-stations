class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.datetime :start_time, null: false,comment: "上映開始時刻"
      t.datetime :end_time, null: false, comment: "上映終了時刻"
      t.references :movie, 
                    null: false, 
                    index: 
                      { 
                        name: "movie_id_idx"
                      },
                    foreign_key: 
                      {
                        to_table: :movies, 
                        name:"movie_id"
                      }
      t.timestamps
    end
  end
end
