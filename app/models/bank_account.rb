class BankAccount < ApplicationRecord
  self.table_name = "BankAccount"
  self.primary_key = "Bank_account_id"

  has_many :Provider
end
