class Contact < ApplicationRecord
  self.table_name = 'contact'
  self.primary_key = 'contact_id'
  # validates :first_name, :last_name, :email, :contact_number, :store_name, presence: true
end
