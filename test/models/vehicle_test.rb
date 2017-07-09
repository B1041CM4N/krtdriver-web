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

require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
