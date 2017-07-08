# == Schema Information
#
# Table name: address
#
#  address_id    :integer          not null, primary key
#  commune_id    :integer
#  street_name   :string(35)
#  street_number :string(7)
#  block_number  :string(5)
#  town_name     :string(20)
#
# Indexes
#
#  FK_Address_Comune  (commune_id)
#
# Foreign Keys
#
#  FK_Address_Comune  (commune_id => commune.commune_id)
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
