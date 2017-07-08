# == Schema Information
#
# Table name: punishment
#
#  punishment_id    :integer          not null, primary key
#  reason           :string(100)
#  duration         :integer
#  denegate_service :integer
#  count            :integer
#

require 'test_helper'

class PunishmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
