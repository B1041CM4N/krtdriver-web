# == Schema Information
#
# Table name: request
#
#  request_id          :integer          not null, primary key
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
#  FK_Request_Consumer          (consumer_id => consumer.consumer_id)
#  FK_Request_Provider          (provider_id => provider.provider_id)
#  FK_Request_Request_category  (request_category_id => request_category.request_category_id)
#

class Request < ApplicationRecord
  self.table_name = 'request'
  self.primary_key = 'request_id'

  belongs_to :consumer, foreign_key: :consumer_id, class_name: 'Consumer'
  belongs_to :request_category, foreign_key: :rc_id, class_name: 'RequestCategory'
end
