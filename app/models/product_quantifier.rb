class ProductQuantifier < ApplicationRecord
  self.table_name = 'productquantifier'

  belongs_to :order_sale, foreign_key: :order_id, class_name: 'OrderSale'
  belongs_to :product, foreign_key: :idprod, class_name: 'Product'
end
