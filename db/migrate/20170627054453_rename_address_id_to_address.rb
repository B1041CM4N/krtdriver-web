class RenameAddressIdToAddress < ActiveRecord::Migration[5.0]
  def change
    rename_column :stores, :address_id, :address
  end
end
