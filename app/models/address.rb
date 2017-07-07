# == Schema Information
#
# Table name: address
#
#  id            :integer          not null, primary key
#  commune_id    :integer
#  street_name   :string(35)
#  street_number :string(7)
#  block_number  :string(5)
#  town_name     :string(20)
#
# Indexes
#
#  FK_Address_Comune  (commune_id)
#
# Foreign Keys
#
#  FK_Address_Comune  (commune_id => commune.id)
#

class Address < ApplicationRecord
  self.table_name = 'address'
  self.primary_key = 'address_id'
  
  has_many :store
end
