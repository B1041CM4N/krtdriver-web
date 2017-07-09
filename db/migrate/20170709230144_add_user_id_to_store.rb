class AddUserIdToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :store, :user_id, :integer
  end
end
