# == Schema Information
#
# Table name: product
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  name           :string(30)
#  description    :string(500)
#  image          :string(100)
#  file_in_server :string(255)
#  store_id       :integer
#
# Indexes
#
#  FK_Product_Category  (category_id)
#
# Foreign Keys
#
#  FK_Product_Category  (category_id => category.id)
#

require 'carrierwave/orm/activerecord'

class Product < ApplicationRecord
  self.table_name = 'product'
  self.primary_key = 'product_id'
  
  mount_uploader :file_in_server, ProductUploader

  paginates_per 10
  belongs_to :category, foreign_key: :category_id
  belongs_to :store, foreign_key: :store_id
  has_many :inventory, dependent: :destroy

  # has_and_belongs_to_many :Inventory

  validates :name, :description, :category_id, presence: true
  # validates :name, :description, :price, presence: true
  # validates :price, numericality: true
  # validates :store_id, presence: true
  # validates :image, presence: true
end
