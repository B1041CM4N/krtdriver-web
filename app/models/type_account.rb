# == Schema Information
#
# Table name: type_account
#
#  ta_id :integer          not null, primary key
#  name  :string(35)
#

class TypeAccount < ApplicationRecord
  self.table_name = 'type_account'
  self.primary_key = 'ta_id'

  has_many :bank_accounts, class_name: 'BankAccount'
end
