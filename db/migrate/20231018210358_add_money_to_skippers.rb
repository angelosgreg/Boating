class AddMoneyToSkippers < ActiveRecord::Migration[7.0]
  def change
    add_column :skippers, :money, :integer
  end
end
