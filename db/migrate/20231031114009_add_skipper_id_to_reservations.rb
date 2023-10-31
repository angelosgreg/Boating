class AddSkipperIdToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :skipper_id, :integer
  end
end
