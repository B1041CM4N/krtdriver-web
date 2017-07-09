# == Schema Information
#
# Table name: request_category
#
#  rc_id       :integer          not null, primary key
#  name        :string(60)
#  description :string(500)
#

class RequestCategory < ApplicationRecord
  self.table_name = 'request_category'
  self.primary_key = 'rc_id'

  has_many :requests, class_name: 'Request'
end
