# == Schema Information
#
# Table name: Store
#
#  Store_id    :integer          not null, primary key
#  Address_id  :integer
#  Name        :string(35)
#  Description :string(200)
#  users_id    :integer
#
# Indexes
#
#  FK_Store_Adress          (Address_id)
#  index_Store_on_users_id  (users_id)
#
# Foreign Keys
#
#  FK_Store_Adress  (Address_id => Address.Address_id)
#  fk_rails_...     (users_id => users.id)
#

class Store < ApplicationRecord

  self.table_name = 'Store'
  self.primary_key = 'Store_id'
  paginates_per 10

  belongs_to :user
  belongs_to :Address, foreign_key: 'Address_id'
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  validates :name, :address, :description, :sale_id, presence: true
end
