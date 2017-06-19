class CreateSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :segments do |t|
      t.integer :provider_id
      t.integer :amount
      t.decimal :commission

      t.timestamps
    end
  end
end
