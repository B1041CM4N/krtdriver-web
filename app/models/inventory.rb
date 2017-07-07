# == Schema Information
#
# Table name: Inventory
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
#  FK_Inventory_Product   (product_id => product.id)
#  FK_Inventory_Provider  (provider_id => provider.id)
#

class Inventory < ApplicationRecord
  self.table_name = 'inventory'
  belongs_to :product, foreign_key: :product_id
  belongs_to :provider, foreign_key: :provider_id
end