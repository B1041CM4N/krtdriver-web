# == Schema Information
#
# Table name: user
#
#  user_id                :integer          not null, primary key
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
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  role                   :integer
#
# Indexes
#
#  index_user_on_confirmation_token    (confirmation_token) UNIQUE
#  index_user_on_email                 (email) UNIQUE
#  index_user_on_reset_password_token  (reset_password_token) UNIQUE
#  index_user_on_unlock_token          (unlock_token) UNIQUE
#

class User < ApplicationRecord
  self.table_name = 'user'
  self.primary_key = 'user_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable,
         :timeoutable
  # class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  # self.table_name = 'User'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  # has_many :Order, foreign_key: :Order_id

  enum role: [:admin, :provider, :owner]
  after_initialize :set_default_role, if: :new_record?
  # before_create :create_store

  has_one :store, class_name: 'Store'
  has_one :bank_account, class_name: 'BankAccount'
  has_many :addresses, class_name: 'Address'

  # alias_attribute "Name", "name"

  # def set_default_role
  #   self.role ||= :provider
  # end

  ## CALLBACK QUE PERMITE LA CREACIÓN SOLO DE USUARIOS DE TIPO TIENDA - FORMULARIO REGISTRO SESSIONS/NEW

  def set_default_role
    self.role ||= :owner
  end
  # validates :email, :password, :store_name, :street_name, :password_confirmation, presence: true
end
