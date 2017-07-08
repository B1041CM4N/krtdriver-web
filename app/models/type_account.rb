# == Schema Information
#
# Table name: type_account
#
#  type_account_id :integer          not null
#  name            :string(35)
#

class TypeAccount < ApplicationRecord
  self.table_name = 'type_account'
  self.primary_key = 'ta_id'
end
