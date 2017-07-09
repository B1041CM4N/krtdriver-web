# == Schema Information
#
# Table name: vehiclebrand
#
#  vehicle_brand_id :integer          not null, primary key
#  name             :string(15)
#

class VehicleBrand < ApplicationRecord
  self.table_name = 'vehiclebrand'
  self.primary_key = 'vehicle_brand_id'

  has_many :vehicles, class_name: 'Vehicle'
end
