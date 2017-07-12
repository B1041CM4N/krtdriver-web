# == Schema Information
#
# Table name: consumer
#
#  consumer_id    :integer          not null, primary key
#  address_id     :integer
#  rut            :string(10)
#  email          :string(40)
#  password       :string(50)
#  facebook_token :string(255)
#  google_token   :string(255)
#  first_name     :string(30)
#  last_name      :string(30)
#
# Indexes
#
#  FK_Consumer_Address  (address_id)
#
# Foreign Keys
#
#  FK_Consumer_Address  (address_id => address.address_id)
#

class Consumer < ApplicationRecord
  self.table_name = 'consumer'
  self.primary_key = 'consumer_id'

  belongs_to :address, foreign_key: 'address_id', class_name: 'Address'
  has_many :credit_cards, class_name: 'CreditCard'
  has_many :debit_cards, class_name: 'DebitCard'
  has_many :order_sales, class_name: 'OrderSale'
  has_many :requests, class_name: 'Request'
  has_many :scores, class_name: 'Score'
end
