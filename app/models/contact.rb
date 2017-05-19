class Contact < ApplicationRecord
  validates :first_name, :last_name, :email, :contact_number, :store_name, presence: true
end
