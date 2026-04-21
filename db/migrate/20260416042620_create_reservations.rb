class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date 'date', null: false
      t.string 'email', null: false, comment: '予約者メールアドレス'
      t.string 'name', null: false, comment: '予約者名'

      t.references :schedule, null: false, index: { name: 'reservation_schedule_id_idx' }, foreign_key: true
      t.references :sheet, null: false, index: { name: 'reservation_sheet_id_idx' }, foreign_key: true
      t.timestamps
    end
    add_index :reservations, %i[date schedule_id sheet_id], unique: true
  end
end
