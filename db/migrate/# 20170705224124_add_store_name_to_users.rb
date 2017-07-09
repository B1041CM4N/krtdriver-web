class AddStoreNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :user, :store_name, :string
    add_column :user, :street_name, :string
  end
end
