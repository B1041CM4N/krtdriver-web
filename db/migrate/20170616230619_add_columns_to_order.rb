class AddColumnsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total, :integer
    add_column :orders, :date, :datetime
    add_column :orders, :provider_id, :integer
    add_column :orders, :consumer_id, :integer
    add_column :orders, :order_status, :integer
    add_column :orders, :ticket_number, :integer
  end
end
