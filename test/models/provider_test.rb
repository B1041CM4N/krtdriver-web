# == Schema Information
#
# Table name: provider
#
#  provider_id       :integer          not null, primary key
#  vehicle_id        :integer
#  store_id          :integer
#  address_id        :integer
#  payment_method_id :integer
#  bank_account_id   :integer
#  rut               :string(10)
#  email             :string(40)
#  password          :string(50)
#  first_name        :string(30)
#  last_name         :string(30)
#
# Indexes
#
#  FK_BankAccount_Provider    (bank_account_id)
#  FK_PaymentMethod_Provider  (payment_method_id)
#  FK_Provider_Store          (store_id)
#  FK_Provider_address        (address_id)
#  FK_Vehicle_Provider        (vehicle_id)
#
# Foreign Keys
#
#  FK_BankAccount_Provider    (bank_account_id => bank_account.bank_account_id)
#  FK_PaymentMethod_Provider  (payment_method_id => payment_method.payment_method_id)
#  FK_Provider_Store          (store_id => store.store_id)
#  FK_Provider_address        (address_id => address.address_id)
#  FK_Vehicle_Provider        (vehicle_id => vehicle.vehicle_id)
#

require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
