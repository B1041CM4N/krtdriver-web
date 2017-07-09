# == Schema Information
#
# Table name: productquantifier
#
#  order_id :integer
#  idprod   :integer
#  quantity :integer
#
# Indexes
#
#  FK_Prodped_Order   (order_id)
#  FK_Proped_Product  (idprod)
#
# Foreign Keys
#
#  FK_Prodped_Order   (order_id => ordersale.order_id)
#  FK_Proped_Product  (idprod => product.product_id)
#

class ProductQuantifier < ApplicationRecord
  self.table_name = 'productquantifier'

  belongs_to :order_sale, foreign_key: :order_id, class_name: 'OrderSale'
  belongs_to :product, foreign_key: :idprod, class_name: 'Product'
end
