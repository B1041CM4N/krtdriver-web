class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.integer :bank_id
      t.integer :account_member
      t.string :bank_account_type

      t.timestamps
    end
  end
end
