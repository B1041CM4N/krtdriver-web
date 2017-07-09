class RemoveUserColumnFromStore < ActiveRecord::Migration[5.0]
  def change
    remove_column :store, :user
  end
end
