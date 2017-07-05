# == Schema Information
#
# Table name: Product
#
#  Product_id  :integer          not null, primary key
#  Category_id :integer
#  Name        :string(30)
#  Description :string(500)
#  Image       :string(100)
#  Store_id    :integer
#
# Indexes
#
#  FK_Product_Category  (Category_id)
#
# Foreign Keys
#
#  FK_Product_Category  (Category_id => Category.Category_id)
#

require 'carrierwave/orm/activerecord'

class Product < ApplicationRecord

  self.table_name = 'Product'
  self.primary_key = 'Product_id'

  belongs_to :Category, foreign_key: :Category_id
  belongs_to :Store, foreign_key: :Store_id
  # has_and_belongs_to_many :Inventory
  paginates_per 10
  mount_uploader :Image, ProductUploader

  # validates :Name, :Description, :Category_id, :Image, presence: true
  # validates :name, :description, :price, presence: true
  # validates :price, numericality: true
  # validates :store_id, presence: true
  # validates :image, presence: true
end
