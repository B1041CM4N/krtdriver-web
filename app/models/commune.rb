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

class Commune < ApplicationRecord
  self.table_name = 'commune'
  self.primary_key = 'commune_id'

  belongs_to :province, foreign_key: 'province_id', class_name: 'Province'
  has_many :addresses, class_name: 'Address'
end
