class AddNumberToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :number, :integer
  end
end
