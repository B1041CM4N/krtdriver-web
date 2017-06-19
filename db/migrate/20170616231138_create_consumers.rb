class CreateConsumers < ActiveRecord::Migration[5.0]
  def change
    create_table :consumers do |t|
      t.integer :credit_card_id
      t.integer :address_id
      t.string :rut
      t.string :email
      t.string :password
      t.string :facebook_token
      t.string :google_token
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
