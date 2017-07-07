class AddUserIdToStore < ActiveRecord::Migration[5.0]
  def change
    add_reference :store, :user, foreign_key: :user_id
  end
end
