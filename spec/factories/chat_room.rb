FactoryBot.define do
  factory :chat_room do
    factory :public_chat do
      title { 'Test chat' }
      chat_type { true }
    end

    factory :private_chat do
      title { 'Test chat' }
      chat_type { false }
    end
  end
end
