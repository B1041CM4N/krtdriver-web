class Store < ApplicationRecord
  paginates_per 10
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  validates :name, :address, :description, :sale_id, presence: true
end
