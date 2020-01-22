class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  validates :first_name, :last_name, :email, presence: true, on: :create
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :password, presence: true

  has_many :chat_members, dependent: :destroy
end
