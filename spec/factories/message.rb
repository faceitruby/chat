FactoryBot.define do
  factory :message do
    message { 'Test chat' }
    chat_member_id { create(:member_member).id }
  end
end
