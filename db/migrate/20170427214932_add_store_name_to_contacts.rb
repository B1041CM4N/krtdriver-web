class AddStoreNameToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :store_name, :string
  end
end
