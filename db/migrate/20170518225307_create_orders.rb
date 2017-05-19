class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :store_id
      t.integer :sale
      t.integer :user_id
      t.datetime :date
      t.integer :payment_type_id

      t.timestamps
    end
  end
end
