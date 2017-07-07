# == Schema Information
#
# Table name: store
#
#  id          :integer          not null, primary key
#  address_id  :integer
#  name        :string(35)
#  description :string(200)
#  user_id     :integer
#
# Indexes
#
#  FK_Store_Adress         (address_id)
#  index_store_on_user_id  (user_id)
#
# Foreign Keys
#
#  FK_Store_Adress  (address_id => address.id)
#  fk_rails_...     (user_id => user.id)
#

require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
