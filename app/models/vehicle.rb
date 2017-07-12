# == Schema Information
#
# Table name: vehicle
#
#  vehicle_id       :integer          not null, primary key
#  vehicle_brand_id :integer
#  vehicle_model    :string(15)
#  licence_plate    :string(6)
#  color            :string(20)
#
# Indexes
#
#  FK_Vehiclebrand_Vehicle  (vehicle_brand_id)
#
# Foreign Keys
#
#  FK_Vehiclebrand_Vehicle  (vehicle_brand_id => vehiclebrand.vehicle_brand_id)
#

class Vehicle < ApplicationRecord
  self.table_name = 'vehicle'
  self.primary_key = 'vehicle_id'

  belongs_to :vehicle_brand, foreign_key: 'vehicle_brand_id', class_name: 'VehicleBrand'
  has_many :providers, class_name: 'Provider'
end
