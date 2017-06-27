class Store < ApplicationRecord
  paginates_per 10
  has_many :orders, dependent: :restrict_with_error
  validates :name, :address, :description, presence: true
end
