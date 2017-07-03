class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  enum role: [:admin, :provider, :owner]
  after_initialize :set_default_role, if: :new_record?

  # def set_default_role
  #   self.role ||= :provider
  # end

  ## CALLBACK QUE PERMITE LA CREACIÓN SOLO DE USUARIOS DE TIPO TIENDA - FORMULARIO REGISTRO SESSIONS/NEW

  def set_default_role
    self.role ||= :owner
  end

  validates :email, :password, :password_confirmation, presence: true
end
