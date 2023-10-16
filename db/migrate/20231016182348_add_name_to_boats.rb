class AddNameToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :name, :string
  end
end
