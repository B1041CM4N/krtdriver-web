class AddUserIdToStore < ActiveRecord::Migration[5.0]
  def change
    add_reference :Store, :User, foreign_key: :User_id
  end
end
