require 'carrierwave/orm/activerecord'

class Product < ApplicationRecord
  paginates_per 10
  mount_uploader :image, ProductUploader

  validates :name, :description, :price, :image, presence: true
  validates :price, numericality: true
end
