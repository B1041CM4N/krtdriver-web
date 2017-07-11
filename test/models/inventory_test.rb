# == Schema Information
#
# Table name: inventory
#
#  product_id :integer          primary key
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

require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
