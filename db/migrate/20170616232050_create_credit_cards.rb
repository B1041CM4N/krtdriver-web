class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :bank_id
      t.integer :card_number

      t.timestamps
    end
  end
end
