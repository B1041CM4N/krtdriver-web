# == Schema Information
#
# Table name: product
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  name           :string(30)
#  description    :string(500)
#  image          :string(100)
#  file_in_server :string(255)
#  store_id       :integer
#
# Indexes
#
#  FK_Product_Category  (category_id)
#
# Foreign Keys
#
#  FK_Product_Category  (category_id => category.id)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
