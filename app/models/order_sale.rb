class OrderSale < ApplicationRecord
  self.table_name = 'ordersale'
  self.primary_key = 'order_id'

  belongs_to :consumer, foreign_key: :consumer_id, class_name: 'Consumer'
  belongs_to :payment_method, foreign_key: :paymentmethod_id, class_name: 'PaymentMethod'
  belongs_to :store, foreign_key: :store_id, class_name: 'Store'
end
