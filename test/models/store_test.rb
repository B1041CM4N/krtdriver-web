# == Schema Information
#
# Table name: store
#
#  store_id         :integer          not null, primary key
#  address_id       :integer
#  paymentmethod_id :integer
#  bank_account_id  :integer
#  name             :string(35)
#  description      :string(200)
#  user_id          :integer
#
# Indexes
#
#  FK_BankAccount_Provider    (bank_account_id)
#  FK_PaymentMethod_Provider  (paymentmethod_id)
#  FK_Store_Adress            (address_id)
#
# Foreign Keys
#
#  FK_BankAccount_Provider    (bank_account_id => bankaccount.bank_account_id)
#  FK_PaymentMethod_Provider  (paymentmethod_id => paymentmethod.paymentmethod_id)
#  FK_Store_Adress            (address_id => address.address_id)
#

require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
