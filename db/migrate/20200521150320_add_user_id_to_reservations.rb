class AddUserIdToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :user_id, :int
  end
end
