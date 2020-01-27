require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe 'POST /create' do
    let!(:user) { create(:valid_user) }
    let!(:chat_room) { create(:public_chat) }
    let!(:chat_member) { create(:member_member, user_id: user.id, chat_room_id: chat_room.id) }
    it 'returns http redirect' do
      sign_in user
      post :create, params: { chat_room_id: chat_room.id, message: { message: '123' } }
      expect(response).to have_http_status(:redirect)
    end
  end

end
