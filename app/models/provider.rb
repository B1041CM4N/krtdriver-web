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

class Provider < ApplicationRecord
  self.table_name = 'provider'
  self.primary_key = 'provider_id'

  after_initialize :set_default_payment_method, if: :new_record?

  belongs_to :vehicle, foreign_key: :vehicle_id
  belongs_to :store, foreign_key: :store_id
  belongs_to :address, foreign_key: :address_id
  belongs_to :payment_method, foreign_key: :payment_method_id
  belongs_to :bank_account, foreign_key: :bank_account_id

  def set_default_payment_method
    self.payment_method_id ||= 7
  end

  # self.class.primary_key = "Provider_id"

  def self.fetch(params = {})
    collection = super params
    # collection = attribute_filter(collection, 'product_id', params)
    collection
  end
end
