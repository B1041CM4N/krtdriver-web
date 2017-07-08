# == Schema Information
#
# Table name: vehicle_brand
#
#  id   :integer          not null, primary key
#  name :string(15)
#

class VehicleBrand < ApplicationRecord
  self.table_name = 'vehiclebrand'
  self.primary_key = 'vehicle_brand_id'
end
