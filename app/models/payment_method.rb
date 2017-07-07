class PaymentMethod < ApplicationRecord
  self.table_name = 'payment_method'
  self.primary_key = 'payment_method_id'
end
