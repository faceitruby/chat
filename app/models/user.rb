class User < ApplicationRecord
  before_save :set_default_avatar

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
            remote_avatar_url: data['info']['image'],
            token: data['credentials']['token'],
            refresh_token: data['credentials']['refresh_token'],
            expires_at: data['credentials']['expires_at'],
            expires: data['credentials']['expires'],
            password: Devise.friendly_token(length = 20)
         )
     end
    user
  end

  mount_uploader :avatar, AvatarUploader

  def set_default_avatar
    self.avatar = File.open(
        "#{Rails.root}/app/assets/images/avatars/noavatar.png"
    ) if avatar.blank?
  end

  validates :first_name, :last_name, :email, presence: true, on: :create
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, on: :create
  validates :password, presence: true, on: :create

  has_many :chat_members, dependent: :destroy

  has_and_belongs_to_many :friends, class_name: 'User',
                                    join_table: 'friends',
                                    association_foreign_key: 'friend_id'
  has_and_belongs_to_many :black_lists, class_name: 'User',
                                        join_table: 'black_lists',
                                        association_foreign_key: 'black_list_id'

  def name
    first_name + ' ' + last_name
  end
end
