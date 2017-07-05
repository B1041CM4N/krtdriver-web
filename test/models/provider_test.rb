# == Schema Information
#
# Table name: Provider
#
#  Provider_id      :integer          not null, primary key
#  Vehicle_id       :integer
#  Store_id         :integer
#  Address_id       :integer
#  PaymentMethod_id :integer
#  Bank_account_id  :integer
#  Rut              :string(10)
#  EMail            :string(40)
#  Password         :string(50)
#  First_name       :string(30)
#  Last_name        :string(30)
#
# Indexes
#
#  FK_BankAccount_Provider    (Bank_account_id)
#  FK_PaymentMethod_Provider  (PaymentMethod_id)
#  FK_Provider_Store          (Store_id)
#  FK_Provider_address        (Address_id)
#  FK_Vehicle_Provider        (Vehicle_id)
#
# Foreign Keys
#
#  FK_BankAccount_Provider    (Bank_account_id => BankAccount.Bank_account_id)
#  FK_PaymentMethod_Provider  (PaymentMethod_id => PaymentMethod.PaymentMethod_id)
#  FK_Provider_Store          (Store_id => Store.Store_id)
#  FK_Provider_address        (Address_id => Address.Address_id)
#  FK_Vehicle_Provider        (Vehicle_id => Vehicle.Vehicle_id)
#

require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
