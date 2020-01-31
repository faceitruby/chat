FactoryBot.define do
  factory :chat_room do
    public

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
