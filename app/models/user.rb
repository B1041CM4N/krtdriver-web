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

  has_many :Store, dependent: :destroy

  # alias_attribute "Name", "name"

  # def set_default_role
  #   self.role ||= :provider
  # end

  ## CALLBACK QUE PERMITE LA CREACIÓN SOLO DE USUARIOS DE TIPO TIENDA - FORMULARIO REGISTRO SESSIONS/NEW

  def set_default_role
    self.role ||= :owner
  end

  validates :email, :password, :password_confirmation, presence: true
end
