class Store < ApplicationRecord
  paginates_per 10
  has_many :orders
  validates :name,:address, :phone, presence: true
end
