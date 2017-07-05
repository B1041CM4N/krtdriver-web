# == Schema Information
#
# Table name: Store
#
#  Store_id    :integer          not null, primary key
#  Address_id  :integer
#  Name        :string(35)
#  Description :string(200)
#  User_id     :integer
#
# Indexes
#
#  FK_Store_Adress         (Address_id)
#  index_Store_on_User_id  (User_id)
#
# Foreign Keys
#
#  FK_Store_Adress  (Address_id => Address.Address_id)
#  fk_rails_...     (User_id => Users.id)
#

require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
