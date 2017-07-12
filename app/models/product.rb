# == Schema Information
#
# Table name: product
#
#  product_id     :integer          not null, primary key
#  category_id    :integer
#  name           :string(30)
#  description    :string(500)
#  image          :string(256)
#  file_in_server :string(256)
#
# Indexes
#
#  FK_Product_Category  (category_id)
#
# Foreign Keys
#
#  FK_Product_Category  (category_id => category.category_id)
#

require 'carrierwave/orm/activerecord'

class Product < ApplicationRecord
  self.table_name = 'product'
  self.primary_key = 'product_id'
  
  mount_uploader :file_in_server, ProductUploader

  paginates_per 10
  
  belongs_to :category, foreign_key: 'category_id', class_name: 'Category'
  has_many :inventories, class_name: 'Inventory', dependent: :destroy
  has_many :stores, through: :inventories
  has_many :product_quantifiers, class_name: 'ProductQuantifier'

  # has_and_belongs_to_many :Inventory

  # validates :name, :description, :category_id, presence: true
  # validates :name, :description, :price, presence: true
  # validates :price, numericality: true
  # validates :store_id, presence: true
  # validates :image, presence: true
end
