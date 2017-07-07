class AddFileNameToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :product, :file_in_server, :string, precision: 256
  end
end
