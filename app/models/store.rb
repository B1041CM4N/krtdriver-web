class Store < ApplicationRecord
  has_many :orders
  validates :name,:address, :phone, presence: true
end
