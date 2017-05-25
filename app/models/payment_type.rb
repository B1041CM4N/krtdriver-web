class PaymentType < ApplicationRecord
    has_many :orders
end
