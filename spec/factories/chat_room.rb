FactoryBot.define do
  :public

  factory :chat_room do
    trait :public do
      title { 'Test public chat' }
      chat_type { true }
    end

    trait :private do
      title { 'Test private chat' }
      chat_type { false }
    end
  end
end
