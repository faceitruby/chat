FactoryBot.define do
  factory :chat_member do
    factory :member_owner do
      user_id { create(:valid_user).id }
      chat_room_id { create(:public_chat).id }
      member_type { 'owner' }
    end

    factory :member_moderator do
      user_id { create(:valid_user).id }
      chat_room_id { create(:public_chat).id }
      member_type { 'moderator' }
    end

    factory :member_member do
      user_id { create(:valid_user).id }
      chat_room_id { create(:public_chat).id }
      member_type { 'member' }
    end
  end
end
