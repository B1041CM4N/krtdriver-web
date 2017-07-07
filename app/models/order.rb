class Order < ApplicationRecord
    self.table_name = 'order'
    self.primary_key = 'order_id'
    paginates_per 10
    #belongs_to :store, :user, :payment_type
    #validates :sale, :user_id, :payment_type_id
end
