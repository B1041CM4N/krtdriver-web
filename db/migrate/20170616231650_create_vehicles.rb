class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.integer :vehicle_brand_id
      t.string :model_name
      t.string :licence_plate
      t.string :color

      t.timestamps
    end
  end
end
