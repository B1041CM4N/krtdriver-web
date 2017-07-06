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

  attr_accessor :name
  attr_accessor :Name
  attr_accessor :Address_id
  attr_accessor :address_id

  attr_internal_accessor :store_name

  def store_name
    self.name
  end

  paginates_per 10

  belongs_to :user, foreign_key: :users_id
  belongs_to :Address, foreign_key: :Address_id
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  validates :name, :address, :description, :sale_id, presence: true
end
