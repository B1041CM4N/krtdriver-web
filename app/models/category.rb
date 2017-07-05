# == Schema Information
#
# Table name: Category
#
#  Category_id :integer          not null, primary key
#  Name        :string(35)
#  Description :string(500)
#

class Category < ApplicationRecord
  self.table_name = 'Category'
  self.primary_key = 'Category_id'

  has_many :Product, dependent: :destroy

  # has_many :categories, dependent: destroy
end
