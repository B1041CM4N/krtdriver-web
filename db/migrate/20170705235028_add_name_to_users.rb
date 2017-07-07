class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :user, :owner_name, :string, precision: 255
  end
end
