class Message < ApplicationRecord
  belongs_to :chat_member

  validates :message, presence: true
end
