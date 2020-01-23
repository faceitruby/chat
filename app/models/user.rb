class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :omniauthable,
         :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token
    user = User.where(email: data['info']['email']).first

     unless user
         user = User.create(
            provider: data['provider'],
            uid: data['uid'],
            email: data['info']['email'],
            first_name: data['info']['first_name'],
            last_name: data['info']['last_name'],
            # avatar: data['info']['image'],
            token: data['credentials']['token'],
            refresh_token: data['credentials']['refresh_token'],
            expires_at: data['credentials']['expires_at'],
            expires: data['credentials']['expires'],
            password: Devise.friendly_token(length = 20)
         )
     end
    user
  end

  validates :first_name, :last_name, :email, presence: true, on: :create
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :password, presence: true

  has_many :chat_members, dependent: :destroy
end
