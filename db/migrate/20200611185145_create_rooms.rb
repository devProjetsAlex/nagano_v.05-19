class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :room_id
      t.string :room_description
      t.integer :room_price

      t.timestamps
    end
  end
end
