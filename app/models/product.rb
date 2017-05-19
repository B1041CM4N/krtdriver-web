require 'carrierwave/orm/activerecord'

class Product < ApplicationRecord
  mount_uploader :image, ProductUploader

  validates :name, :description, :price, :image, presence: true
  validates :price, numericality: true
end
