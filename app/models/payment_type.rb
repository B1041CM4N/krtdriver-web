class PaymentType < ApplicationRecord
  self.table_name = 'payment_type'
  self.primary_key = 'payment_type_id'
  
  has_many :orders, class_name: 'OrderSale'
end
