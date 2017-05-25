class Order < ApplicationRecord
    belongs_to :store, :user, :payment_type
    validates :sale,  :user_id, :payment_type_id
end
