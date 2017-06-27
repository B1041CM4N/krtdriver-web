class DropTableDrivers < ActiveRecord::Migration[5.0]
  def change
    drop_table :drivers
  end
end
