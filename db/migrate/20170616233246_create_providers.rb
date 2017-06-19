class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.integer :bank_account_id
      t.integer :vehicle_id
      t.integer :store_id
      t.integer :address_id
      t.integer :segment_id
      t.string :rut
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
