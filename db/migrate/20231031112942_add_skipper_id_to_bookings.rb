class AddSkipperIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :skipper_id, :integer
  end
end
