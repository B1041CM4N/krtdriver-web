# == Schema Information
#
# Table name: commune
#
#  commune_id  :integer          not null, primary key
#  province_id :integer
#  name        :string(20)
#
# Indexes
#
#  FK_Commune_Province  (province_id)
#
# Foreign Keys
#
#  FK_Commune_Province  (province_id => province.province_id)
#

require 'test_helper'

class CommuneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
