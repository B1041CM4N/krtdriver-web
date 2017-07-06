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

require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
