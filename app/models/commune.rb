# == Schema Information
#
# Table name: commune
#
#  id          :integer          not null, primary key
#  province_id :integer
#  name        :string(20)
#
# Indexes
#
#  FK_Commune_Province  (province_id)
#
# Foreign Keys
#
#  FK_Commune_Province  (province_id => province.id)
#

class Commune < ApplicationRecord
  self.table_name = "commune"
  self.primary_key = 'commune_id'
end
