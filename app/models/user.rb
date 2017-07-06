# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  status                 :boolean          default(TRUE)
#  role                   :integer
#  store_name             :string(255)
#  street_name            :string(255)
#  store_description      :string(255)
#  owner_name             :string(255)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # class User < ActiveRecord::Base
  # self.table_name = 'User'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :Order, foreign_key: :Order_id

  enum role: [:admin, :provider, :owner]
  after_initialize :set_default_role, if: :new_record?
  # before_create :create_store

  has_many :Store, foreign_key: :Store_id
  has_many :Address, foreign_key: :Address_id

  # alias_attribute "Name", "name"

  # def set_default_role
  #   self.role ||= :provider
  # end

  ## CALLBACK QUE PERMITE LA CREACIÓN SOLO DE USUARIOS DE TIPO TIENDA - FORMULARIO REGISTRO SESSIONS/NEW

  # Table name: Store
  #
  #  Store_id    :integer          not null, primary key
  #  Address_id  :integer
  #  Name        :string(35)
  #  Description :string(200)
  #  users_id    :integer

  def set_default_role
    self.role ||= :owner
  end

#   Address_id    :integer          not null, primary key
#  Commune_id    :integer
#  Street_name   :string(35)
#  Street_number :string(7)
#  Block_number  :string(5)
#  Town_name     :string(20)

  # def create_store
  #   address = Address.create(
  #     Street_name: self.street_name
  #   )
# 
  #   Store.create(
  #     Address_id: address.Address_id,
  #     Name: self.store_name,
  #     Description: self.store_description,
  #     users_id: self.id
  #   )
  # end
# 
  validates :email, :password, :store_name, :street_name, :password_confirmation, presence: true
end
