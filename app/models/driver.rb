class Driver < ApplicationRecord
  validates :first_name, :last_name, :rut, :nickname, :contact_number, :email, :web, :sector, presence: true
end
