# == Schema Information
#
# Table name: store
#
#  store_id         :integer          not null, primary key
#  address_id       :integer
#  paymentmethod_id :integer
#  bank_account_id  :integer
#  name             :string(35)
#  description      :string(200)
#  user_id          :integer
#
# Indexes
#
#  FK_BankAccount_Provider    (bank_account_id)
#  FK_PaymentMethod_Provider  (paymentmethod_id)
#  FK_Store_Adress            (address_id)
#
# Foreign Keys
#
#  FK_BankAccount_Provider    (bank_account_id => bankaccount.bank_account_id)
#  FK_PaymentMethod_Provider  (paymentmethod_id => paymentmethod.paymentmethod_id)
#  FK_Store_Adress            (address_id => address.address_id)
#

require 'google_maps_service'

class Store < ApplicationRecord
  self.table_name = 'store'
  self.primary_key = 'store_id'

  # Setup global parameters
  GoogleMapsService.configure do |config|
    config.key = 'AIzaSyBfTzvvp0hvqyEn6JkOmzmq45FzbrbsJZw'
    config.retry_timeout = 20
    config.queries_per_second = 10
  end

  paginates_per 10

  belongs_to :user, foreign_key: 'user_id', class_name: 'User'

  has_one :address, foreign_key: 'address_id', class_name: 'Address'
  has_one :payment_method, foreign_key: 'paymentmethod_id', class_name: 'PaymentMethod'
  belongs_to :bank_account, foreign_key: 'bank_account_id', class_name: 'BankAccount'

  has_many :inventories, class_name: 'Inventory'
  has_many :products, through: :inventories
  has_many :order_sales, class_name: 'OrderSale'
  has_many :providers, class_name: 'Provider'
  has_many :sale_historicals, class_name: 'SaleHistorical'
  has_many :scores, class_name: 'Score'

  enum payment_method: [:efectivo, :debito, :credito]
  # has_many :orders, dependent: :destroy
  # has_many :products, dependent: :destroy
  # validates :name, :address, :description, presence: true
end
