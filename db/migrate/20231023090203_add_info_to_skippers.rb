class AddInfoToSkippers < ActiveRecord::Migration[7.0]
  def change
    add_column :skippers, :info, :string
  end
end
