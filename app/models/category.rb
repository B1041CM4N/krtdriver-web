# == Schema Information
#
# Table name: category
#
#  id          :integer          not null, primary key
#  name        :string(35)
#  description :string(500)
#

class Category < ApplicationRecord
  self.table_name = 'category'
  self.primary_key = 'category_id'

  has_many :product, dependent: :destroy

  # has_many :categories, dependent: destroy
end
