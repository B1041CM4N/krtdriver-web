class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :commune_id
      t.string :street_name
      t.integer :street_number
      t.integer :block_number
      t.string :town_name
      t.string :location_coordenates

      t.timestamps
    end
  end
end
