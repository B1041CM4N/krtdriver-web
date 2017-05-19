class Store < ApplicationRecord
  validates :name,:address, :phone, presence: true
end
