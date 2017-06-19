class CreateTracings < ActiveRecord::Migration[5.0]
  def change
    create_table :tracings do |t|
      t.integer :consumer_id
      t.integer :provider_id
      t.string :latitude
      t.string :longitude
      t.integer :session_id

      t.timestamps
    end
  end
end
