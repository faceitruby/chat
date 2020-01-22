class ChatMember < ApplicationRecord
  belongs_to :user
  belongs_to :chat_rooms
end
