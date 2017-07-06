# == Schema Information
#
# Table name: Inventory
#
#  Product_id  :integer
#  Provider_id :integer
#  Quantity    :integer
#  Price       :integer
#
# Indexes
#
#  FK_Inventory_Product   (Product_id)
#  FK_Inventory_Provider  (Provider_id)
#
# Foreign Keys
#
#  FK_Inventory_Product   (Product_id => Product.Product_id)
#  FK_Inventory_Provider  (Provider_id => Provider.Provider_id)
#

class Inventory < ApplicationRecord

  self.table_name = "Inventory"

  belongs_to :Product, foreign_key: :Product_id
  belongs_to :Provider, foreign_key: :Provider_id

  
end
