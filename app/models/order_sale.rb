# == Schema Information
#
# Table name: ordersale
#
#  order_id         :integer          not null, primary key
#  total            :integer
#  date             :datetime
#  consumer_id      :integer          not null
#  paymentmethod_id :integer
#  store_id         :integer
#  order_status     :integer
#  ticket_number    :integer
#
# Indexes
#
#  FK_Consumer_order           (consumer_id)
#  FK_OrderSale_PaymentMEthod  (paymentmethod_id)
#  fk_Pedido_Distribuidor1     (store_id)
#
# Foreign Keys
#
#  FK_Consumer_order           (consumer_id => consumer.consumer_id)
#  FK_OrderSale_PaymentMEthod  (paymentmethod_id => paymentmethod.paymentmethod_id)
#  fk_Pedido_Distribuidor1     (store_id => store.store_id)
#

class OrderSale < ApplicationRecord
  self.table_name = 'ordersale'
  self.primary_key = 'order_id'

  paginates_per 10

  # def order_status(order_status)
  #   stat_name = ''
  #   if order_status == 3
  #     stat_name = 'Orden Entregada'
  #   elsif order_status == 2
  #     stat_name = 'Orden en reparto'
  #   elsif order_status == 1
  #     stat_name = 'Orden rechazada'
  #   elsif order_status == 0
  #     stat_name = 'Solicitud en Orden'
  #   elsif order_status.nil?
  #     stat_name = 'No tiene estado'
  #   end
  #   stat_name
  # end

  enum order_status: [:pending, :rejected, :in_route, :deliver]

  belongs_to :consumer, foreign_key: 'consumer_id', class_name: 'Consumer'
  belongs_to :payment_method, foreign_key: 'paymentmethod_id', class_name: 'PaymentMethod'
  belongs_to :store, foreign_key: 'store_id', class_name: 'Store'
  has_many :product_quantifiers, class_name: 'ProductQuantifier'

  scope :by_status, ->(order_status) { where(order_status: order_status) }
  scope :by_date, ->(date) { where(date: date) }

end
