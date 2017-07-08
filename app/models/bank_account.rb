class BankAccount < ApplicationRecord
  self.table_name = "bankaccount"
  self.primary_key = "bank_account_id"

  belongs_to :bank, foreign_key: :bank_id, class_name: 'Bank'
  belongs_to :type_account, foreign_key: :ta_id, class_name: 'TypeAccount'
end
