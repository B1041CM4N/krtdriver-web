class AddColumnsToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :address_id, :integer
    add_column :stores, :description, :string
    remove_column :stores, :address
  end
end
