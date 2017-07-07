# == Schema Information
#
# Table name: consumer
#
#  id             :integer          not null, primary key
#  address_id     :integer
#  rut            :string(10)
#  email          :string(40)
#  password       :string(50)
#  facebook_Token :string(255)
#  google_Token   :string(255)
#  first_name     :string(30)
#  last_name      :string(30)
#
# Indexes
#
#  FK_Consumer_Address  (address_id)
#
# Foreign Keys
#
#  FK_Consumer_Address  (address_id => address.id)
#

class Consumer < ApplicationRecord
  self.table_name = 'consumer'
  self.primary_key = 'consumer_id'
end
