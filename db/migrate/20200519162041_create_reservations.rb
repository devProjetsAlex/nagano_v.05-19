class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :arrival_date
      t.date :departure_date
      t.integer :room_id
      t.string :room_request

      t.timestamps
    end
  end
end
