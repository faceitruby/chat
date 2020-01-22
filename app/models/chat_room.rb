class ChatRoom < ApplicationRecord
  has_many :chat_members, dependent: :destroy
end
