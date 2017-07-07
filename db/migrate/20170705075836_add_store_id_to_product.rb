class AddStoreIdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :product, :store_id, :integer
  end
end
