# == Schema Information
#
# Table name: address
#
#  address_id    :integer          not null, primary key
#  commune_id    :integer
#  street_name   :string(35)
#  street_number :string(7)
#  block_number  :string(5)
#  town_name     :string(20)
#  latitude      :string(20)
#  longitude     :string(20)
#
# Indexes
#
#  FK_Address_Comune  (commune_id)
#
# Foreign Keys
#
#  FK_Address_Comune  (commune_id => commune.commune_id)
#

class Address < ApplicationRecord
  self.table_name = 'address'
  self.primary_key = 'address_id'
  belongs_to :commune, foreign_key: :commune_id, class_name: 'Commune'
  has_many :stores, class_name: 'Store'
  has_many :consumer, class_name: 'Consumer'
end
