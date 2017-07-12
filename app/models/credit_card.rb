# == Schema Information
#
# Table name: credit_card
#
#  credit_card_id       :integer          not null, primary key
#  bank_id              :integer
#  credit_card_brand_id :integer
#  consumer_id          :integer
#  card_number          :string(25)
#
# Indexes
#
#  FK_Creditcard_Bank  (bank_id)
#  FK_Reference_37     (consumer_id)
#  FK_bank_brandct     (credit_card_brand_id)
#
# Foreign Keys
#
#  FK_Creditcard_Bank  (bank_id => bank.bank_id)
#  FK_Reference_37     (consumer_id => consumer.consumer_id)
#  FK_bank_brandct     (credit_card_brand_id => credit_card_brand.credit_card_brand_id)
#

class CreditCard < ApplicationRecord
  self.table_name = 'credit_card'
  self.primary_key = 'credit_card_id'

  belongs_to :bank, foreign_key: 'bank_id', class_name: 'Bank'
  belongs_to :credit_card_brand, foreign_key: 'btc_id', class_name: 'CreditCardBrand'
  belongs_to :consumer, foreign_key: 'consumer_id', class_name: 'Consumer'
end
