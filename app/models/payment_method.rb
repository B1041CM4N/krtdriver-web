# == Schema Information
#
# Table name: paymentmethod
#
#  paymentmethod_id :integer          not null, primary key
#  mcash            :integer
#  mdebit           :integer
#  mcredit          :integer
#

class PaymentMethod < ApplicationRecord
  self.table_name = 'paymentmethod'
  self.primary_key = 'paymentmethod_id'

  has_many :payment_methods, class_name: 'PaymentMethod'
  has_many :stores, class_name: 'Store'
end
