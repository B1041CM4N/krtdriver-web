# == Schema Information
#
# Table name: Address
#
#  Address_id    :integer          not null, primary key
#  Commune_id    :integer
#  Street_name   :string(35)
#  Street_number :string(7)
#  Block_number  :string(5)
#  Town_name     :string(20)
#
# Indexes
#
#  FK_Address_Comune  (Commune_id)
#
# Foreign Keys
#
#  FK_Address_Comune  (Commune_id => Commune.Commune_id)
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
