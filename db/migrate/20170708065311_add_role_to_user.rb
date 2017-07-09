class AddRoleToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :user, :role, :integer
  end
end
