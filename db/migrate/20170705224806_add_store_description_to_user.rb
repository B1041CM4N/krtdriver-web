class AddStoreDescriptionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :user, :store_description, :string
  end
end
