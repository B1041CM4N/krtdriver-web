class AddV1DataProvider < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :contact_number, :string, default: ''
    add_column :contacts, :store_id, :integer
  end
end
