class RemoveSkipperIdFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :skipper_id, :integer
  end
end
