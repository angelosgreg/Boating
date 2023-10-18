class AddFirstnameToSkippers < ActiveRecord::Migration[7.0]
  def change
    add_column :skippers, :firstname, :string
  end
end
