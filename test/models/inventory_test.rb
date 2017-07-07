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

require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
