# == Schema Information
#
# Table name: bankaccount
#
#  bank_account_id   :integer          not null, primary key
#  bank_id           :integer
#  ta_id             :integer
#  account_number    :integer
#  bank_account_type :string(20)
#  user_id           :integer
#
# Indexes
#
#  FK_Bankaccount_Bank      (bank_id)
#  FK_taccount_Bankaccount  (ta_id)
#
# Foreign Keys
#
#  FK_Bankaccount_Bank      (bank_id => bank.bank_id)
#  FK_taccount_Bankaccount  (ta_id => type_account.ta_id)
#

class BankAccount < ApplicationRecord
  self.table_name = 'bankaccount'
  self.primary_key = 'bank_account_id'
  
  belongs_to :bank, foreign_key: 'bank_id', class_name: 'Bank'
  belongs_to :type_account, foreign_key: 'ta_id', class_name: 'TypeAccount'
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :stores, class_name: 'Store'
end
