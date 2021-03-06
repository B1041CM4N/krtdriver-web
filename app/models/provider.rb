# == Schema Information
#
# Table name: provider
#
#  provider_id :integer          not null, primary key
#  vehicle_id  :integer
#  store_id    :integer
#  rut         :string(10)
#  email       :string(40)
#  password    :string(50)
#  first_name  :string(30)
#  last_name   :string(30)
#
# Indexes
#
#  FK_Provider_Store    (store_id)
#  FK_Vehicle_Provider  (vehicle_id)
#
# Foreign Keys
#
#  FK_Provider_Store    (store_id => store.store_id)
#  FK_Vehicle_Provider  (vehicle_id => vehicle.vehicle_id)
#

require 'run_cl'
include RunCl::ActAsRun
class Provider < ApplicationRecord
  self.table_name = 'provider'
  self.primary_key = 'provider_id'

  paginates_per 10

  # after_initialize :set_default_payment_method, if: :new_record?

  validates_length_of :rut, minimum: 8, maximum: 10, message: 'El RUT ingresado no es valido'
  validates :rut, presence: true, uniqueness: true
  has_run_cl :rut, skip_db_format_clear: true

  validates :vehicle_id, :store_id, :rut, :email, :password, :first_name, :last_name, presence: true
  # validates_length_of :rut, minimum: 9, maximum: 12, allow_blank: false, 
  validates_length_of :password, minimum: 6, maximum: 20, allow_blank: false

  belongs_to :vehicle, foreign_key: 'vehicle_id', class_name: 'Vehicle'
  belongs_to :store, foreign_key: 'store_id', class_name: 'Store'
  has_many :trackings, class_name: 'Tracking'

  # def set_default_payment_method
  #   self.paymentmethod_id ||= 7
  # end

  # self.class.primary_key = "Provider_id"

  def self.fetch(params = {})
    collection = super params
    # collection = attribute_filter(collection, 'product_id', params)
    collection
  end
end
