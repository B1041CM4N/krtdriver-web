class AddStoreNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :store_name, :string
    add_column :users, :street_name, :string
  end
end
