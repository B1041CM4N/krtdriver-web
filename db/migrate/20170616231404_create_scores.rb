class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :punishment_id
      t.integer :consumer_id
      t.integer :provider_id
      t.integer :puntuation
      t.string :comment
      t.string :suggest
      t.string :claim

      t.timestamps
    end
  end
end
