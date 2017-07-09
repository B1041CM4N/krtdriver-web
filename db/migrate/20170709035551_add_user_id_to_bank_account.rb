class AddUserIdToBankAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :bankaccount, :user_id, :integer
  end
end
