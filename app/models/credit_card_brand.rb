# == Schema Information
#
# Table name: brand_ct
#
#  btc_id :integer          not null, primary key
#  name   :string(35)
#

class CreditCardBrand < ApplicationRecord
  self.table_name = 'brand_ct'
  self.primary_key = 'btc_id'

  has_many :credit_cards, class_name: 'CreditCard'
  has_many :debit_cards, class_name: 'DebitCard'
end
