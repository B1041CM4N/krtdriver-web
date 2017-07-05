# == Schema Information
#
# Table name: Product
#
#  Product_id     :integer          not null, primary key
#  Category_id    :integer
#  Name           :string(30)
#  Description    :string(500)
#  Image          :string(100)
#  Store_id       :integer
#  File_in_server :string(255)
#
# Indexes
#
#  FK_Product_Category  (Category_id)
#
# Foreign Keys
#
#  FK_Product_Category  (Category_id => Category.Category_id)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
