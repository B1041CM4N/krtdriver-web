# == Schema Information
#
# Table name: store
#
#  id          :integer          not null, primary key
#  address_id  :integer
#  name        :string(35)
#  description :string(200)
#  user_id     :integer
#
# Indexes
#
#  FK_Store_Adress         (address_id)
#  index_store_on_user_id  (user_id)
#
# Foreign Keys
#
#  FK_Store_Adress  (address_id => address.id)
#  fk_rails_...     (user_id => user.id)
#

class Store < ApplicationRecord

  self.table_name = 'store'
  self.primary_key = 'store_id'

  paginates_per 10

  belongs_to :user, foreign_key: :user_id
  belongs_to :address, foreign_key: :address_id
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  # validates :name, :address, :description, presence: true
end
