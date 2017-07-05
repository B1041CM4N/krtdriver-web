class AddUserIdToStore < ActiveRecord::Migration[5.0]
  def change
    add_reference :Store, :users, foreign_key: :id
  end
end
