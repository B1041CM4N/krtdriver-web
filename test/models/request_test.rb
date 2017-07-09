# == Schema Information
#
# Table name: request
#
#  request_id   :integer          not null, primary key
#  rc_id        :integer
#  consumer_id  :integer
#  message      :string(1000)
#  name         :string(60)
#  email        :string(20)
#  phone_number :string(15)
#
# Indexes
#
#  FK_Request_Consumer          (consumer_id)
#  FK_Request_Request_category  (rc_id)
#
# Foreign Keys
#
#  FK_Request_Consumer          (consumer_id => consumer.consumer_id)
#  FK_Request_Request_category  (rc_id => request_category.rc_id)
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
