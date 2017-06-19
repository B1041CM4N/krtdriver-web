class CreatePunishments < ActiveRecord::Migration[5.0]
  def change
    create_table :punishments do |t|
      t.string :reason
      t.integer :duration
      t.integer :denegate_service
      t.integer :count

      t.timestamps
    end
  end
end
