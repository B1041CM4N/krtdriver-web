class AddStoreIdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :Product, :Store_id, :integer
  end
end
