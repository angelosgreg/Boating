class CreateBoats < ActiveRecord::Migration[7.0]
  def change
    create_table :boats do |t|

      t.timestamps
    end
  end
end
