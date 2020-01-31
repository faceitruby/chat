FactoryBot.define do
  factory :chat_member do
    association :user, factory: :random_user
    public

    trait :public do
      association :chat_room, :public
    end
    
    trait :private do
      association :chat_room, :private
    end

    factory :member_owner do
      member_type { 'owner' }
    end

    factory :member_moderator do
      member_type { 'moderator' }
    end

    factory :member_member do
      member_type { 'member' }
    end
  end
end
