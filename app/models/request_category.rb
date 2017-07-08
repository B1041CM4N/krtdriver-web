# == Schema Information
#
# Table name: request_category
#
#  request_category_id :integer          not null
#  name                :string(30)
#  description         :string(500)
#

class RequestCategory < ApplicationRecord
  self.table_name = 'request_category'
  self.primary_key = 'rc_id'
end
