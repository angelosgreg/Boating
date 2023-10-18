class AddCityToSkippers < ActiveRecord::Migration[7.0]
  def change
    add_column :skippers, :city, :string
  end
end
