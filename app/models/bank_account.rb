class BankAccount < ApplicationRecord
  self.table_name = "bank_account"
  self.primary_key = "bank_account_id"

  has_many :Provider
end
