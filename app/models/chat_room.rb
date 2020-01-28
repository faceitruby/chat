class ChatRoom < ApplicationRecord
  has_many :chat_members, dependent: :destroy
  has_many :messages, through: :chat_members, dependent: :destroy
end
