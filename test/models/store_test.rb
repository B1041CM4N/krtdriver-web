# == Schema Information
#
# Table name: Store
#
#  Store_id    :integer          not null, primary key
#  Address_id  :integer
#  Name        :string(35)
#  Description :string(200)
#  users_id    :integer
#
# Indexes
#
#  FK_Store_Adress          (Address_id)
#  index_Store_on_users_id  (users_id)
#
# Foreign Keys
#
#  FK_Store_Adress  (Address_id => Address.Address_id)
#  fk_rails_...     (users_id => users.id)
#

require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
