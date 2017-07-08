class DebitCard < ApplicationRecord
  self.table_name = 'debitcard'
  self.primary_key = 'debit_card_id'

  belongs_to :bank, foreign_key: :bank_id, class_name: 'Bank'
  belongs_to :credit_card_brand, foreign_key: :btc_id, class_name: 'CreditCardBrand'
  belongs_to :consumer, foreign_key: :consumer_id, class_name: 'Consumer'
end
