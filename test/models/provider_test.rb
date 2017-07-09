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

require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
