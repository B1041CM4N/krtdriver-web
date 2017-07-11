# == Schema Information
#
# Table name: inventory
#
#  product_id :integer
#  store_id   :integer
#  quantity   :integer
#  price      :integer
#
# Indexes
#
#  FK_Inventory_Product   (product_id)
#  FK_Inventory_Provider  (store_id)
#
# Foreign Keys
#
#  FK_Inventory_Product   (product_id => product.product_id)
#  FK_Inventory_Provider  (store_id => store.store_id)
#

class Inventory < ApplicationRecord
  self.table_name = 'inventory'
  self.primary_key = 'store_id'
  self.primary_key = 'product_id'

  belongs_to :product, foreign_key: 'product_id', class_name: 'Product'
  belongs_to :store, foreign_key: 'store_id', class_name: 'Store'
end
