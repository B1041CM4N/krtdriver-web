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

require 'test_helper'

class BankAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
