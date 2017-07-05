# == Schema Information
#
# Table name: Product
#
#  Product_id     :integer          not null, primary key
#  Category_id    :integer
#  Name           :string(30)
#  Description    :string(500)
#  Image          :string(100)
#  Store_id       :integer
#  File_in_server :string(255)
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
  paginates_per 10
  belongs_to :Category, foreign_key: :Category_id
  belongs_to :Store, foreign_key: :Store_id
  # has_and_belongs_to_many :Inventory
  mount_uploader :Image, ProductUploader

  # validates :Name, :Description, :Category_id, :Image, presence: true
  # validates :name, :description, :price, presence: true
  # validates :price, numericality: true
  # validates :store_id, presence: true
  # validates :image, presence: true
end
