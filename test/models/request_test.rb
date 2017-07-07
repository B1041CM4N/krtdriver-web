# == Schema Information
#
# Table name: request
#
#  id                  :integer          not null, primary key
#  request_category_id :integer
#  consumer_id         :integer
#  provider_id         :integer
#  message             :string(1000)
#  name                :string(60)
#  email               :string(20)
#  phone_number        :string(15)
#
# Indexes
#
#  FK_Request_Consumer          (consumer_id)
#  FK_Request_Provider          (provider_id)
#  FK_Request_Request_category  (request_category_id)
#
# Foreign Keys
#
#  FK_Request_Consumer          (consumer_id => consumer.id)
#  FK_Request_Provider          (provider_id => provider.id)
#  FK_Request_Request_category  (request_category_id => request_category.id)
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
