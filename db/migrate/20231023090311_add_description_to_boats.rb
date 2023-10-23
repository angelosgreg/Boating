class AddDescriptionToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :description, :string
  end
end
