class AddFileNameToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :Product, :File_in_server, :string, precision: 256
  end
end
