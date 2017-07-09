# == Schema Information
#
# Table name: debitcard
#
#  debit_card_id :integer          not null, primary key
#  bank_id       :integer
#  btc_id        :integer
#  consumer_id   :integer
#  card_number   :string(25)
#
# Indexes
#
#  FK_DebitCard_Bank     (bank_id)
#  FK_DebitCard_BrandCT  (btc_id)
#  FK_Reference_36       (consumer_id)
#
# Foreign Keys
#
#  FK_DebitCard_Bank     (bank_id => bank.bank_id)
#  FK_DebitCard_BrandCT  (btc_id => brand_ct.btc_id)
#  FK_Reference_36       (consumer_id => consumer.consumer_id)
#

class DebitCard < ApplicationRecord
  self.table_name = 'debitcard'
  self.primary_key = 'debit_card_id'

  belongs_to :bank, foreign_key: :bank_id, class_name: 'Bank'
  belongs_to :credit_card_brand, foreign_key: :btc_id, class_name: 'CreditCardBrand'
  belongs_to :consumer, foreign_key: :consumer_id, class_name: 'Consumer'
end
