# == Schema Information
#
# Table name: Provider
#
#  id                :integer          not null
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
#  FK_BankAccount_Provider    (bank_account_id => bank_account.id)
#  FK_PaymentMethod_Provider  (payment_method_id => payment_method.id)
#  FK_Provider_Store          (store_id => store.id)
#  FK_Provider_address        (address_id => address.id)
#  FK_Vehicle_Provider        (vehicle_id => vehicle.id)
#

require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
