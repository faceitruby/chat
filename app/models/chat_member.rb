class ChatMember < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  has_many :messages, dependent: :destroy
end
