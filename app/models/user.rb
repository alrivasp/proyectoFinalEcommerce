class User < ApplicationRecord
  include PermissionsConcern

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[facebook]

  has_one_attached :avatar
  belongs_to :commune
  has_many :reviews
  has_many :orders
  has_many :conversations
  enum gender: [:Masculino, :Femenino]

  #Devise anular el método de destrucción del usuario
  def destroy
    update_attributes(deactivated: true) unless deactivated
  end
  #Devise prohibirles que inicien sesión
  def active_for_authentication?
    super && !deactivated
  end

  #Inicio de sesion con facebook
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end
end
