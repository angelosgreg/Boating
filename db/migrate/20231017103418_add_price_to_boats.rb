class AddPriceToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :price, :integer
  end
end
