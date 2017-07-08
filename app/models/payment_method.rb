class PaymentMethod < ApplicationRecord
  self.table_name = 'paymentmethod'
  self.primary_key = 'paymentmethod_id'
end
