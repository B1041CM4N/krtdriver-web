class CreateProductOrders < ActiveRecord::Migration[5.0]
  def change
    create_join_table :products, :orders do |t|
      t.integer :order_id
      t.integer :provider_id
      t.integer :product_id
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
