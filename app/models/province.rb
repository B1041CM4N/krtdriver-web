# == Schema Information
#
# Table name: province
#
#  province_id :integer          not null, primary key
#  name        :string(23)
#

class Province < ApplicationRecord
  self.table_name = 'province'
  self.primary_key = 'province_id'

  has_many :commune
end
