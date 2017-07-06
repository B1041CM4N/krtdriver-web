class AddStoreDescriptionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :store_description, :string
  end
end
