class AddLastnameToSkippers < ActiveRecord::Migration[7.0]
  def change
    add_column :skippers, :lastname, :string
  end
end
