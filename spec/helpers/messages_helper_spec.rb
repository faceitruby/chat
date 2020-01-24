require 'rails_helper'

RSpec.describe MessagesHelper, type: :helper do
  let!(:user) { create(:valid_user) }
  let!(:chat_room) { create(:public_chat) }
  let!(:chat_member) { create(:member_member, user_id: user.id, chat_room_id: chat_room.id) }
  it 'return user name' do
    expect(helper.chat_member_to_name(user)).to eq('James Bond')
  end
end
