# == Schema Information
#
# Table name: credit_card
#
#  id                   :integer          not null, primary key
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
#  FK_Creditcard_Bank  (bank_id => bank.id)
#  FK_Reference_37     (consumer_id => consumer.id)
#  FK_bank_brandct     (credit_card_brand_id => credit_card_brand.id)
#

class CreditCard < ApplicationRecord
  self.table_name = 'credit_card'
  self.primary_key = 'credit_card_id'
end
