class RemoveBoatInFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :boat_in, :integer
  end
end
