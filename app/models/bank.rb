# == Schema Information
#
# Table name: bank
#
#  bank_id     :integer          not null, primary key
#  name        :string(50)
#  description :string(500)
#

class Bank < ApplicationRecord
  self.table_name = 'bank'
  self.primary_key = 'bank_id'
end
