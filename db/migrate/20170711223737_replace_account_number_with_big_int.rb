class ReplaceAccountNumberWithBigInt < ActiveRecord::Migration[5.0]
  def change
    remove_column :bankaccount, :account_number
    add_column :bankaccount, :account_number, :bigint, default: 0
  end
end
