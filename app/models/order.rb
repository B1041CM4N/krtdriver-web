class Order < ApplicationRecord
    paginates_per 10
    belongs_to :store, :user, :payment_type
    validates :sale,  :user_id, :payment_type_id
end
