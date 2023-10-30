class AddBoatIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :boat_id, :integer
  end
end
