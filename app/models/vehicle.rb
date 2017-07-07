# == Schema Information
#
# Table name: vehicle
#
#  id               :integer          not null, primary key
#  vehicle_brand_id :integer
#  model_name       :string(15)
#  licence_plate    :string(6)
#  color            :string(20)
#
# Indexes
#
#  FK_Vehiclebrand_Vehicle  (vehicle_brand_id)
#
# Foreign Keys
#
#  FK_Vehiclebrand_Vehicle  (vehicle_brand_id => vehicle_brand.id)
#

class Vehicle < ApplicationRecord
  self.table_name = 'vehicle'
  self.primary_key = 'vehicle_id'
end
