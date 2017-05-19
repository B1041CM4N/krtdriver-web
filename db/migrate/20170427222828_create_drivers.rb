class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :rut
      t.string :nickname
      t.string :contact_number
      t.string :email
      t.string :web
      t.string :sector
      t.integer :sex

      t.timestamps
    end
  end
end
