require 'carrierwave/orm/activerecord'

class Product < ApplicationRecord
  belongs_to :store
  paginates_per 10
  mount_uploader :image, ProductUploader

  validates :name, :description, :price, :image, presence: true
  validates :price, numericality: true
  validates :store_id, presence: true
end
