# == Schema Information
#
# Table name: request_category
#
#  id          :integer          not null, primary key
#  name        :string(30)
#  description :string(500)
#

class RequestCategory < ApplicationRecord
  self.table_name = 'request_category'
  self.primary_key = 'request_category_id'
end
