# == Schema Information
#
# Table name: inventory
#
#  product_id  :integer
#  provider_id :integer
#  quantity    :integer
#  price       :integer
#
# Indexes
#
#  FK_Inventory_Product   (product_id)
#  FK_Inventory_Provider  (provider_id)
#
# Foreign Keys
#
#  FK_Inventory_Product   (product_id => product.product_id)
#  FK_Inventory_Provider  (provider_id => provider.provider_id)
#

class Inventory < ApplicationRecord
  self.table_name = 'inventory'

  belongs_to :product, foreign_key: :product_id, class_name: 'Product'
  belongs_to :store, foreign_key: :store_id, class_name: 'Store'
end
