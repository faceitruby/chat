require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do
  describe 'GET /create' do
    let(:user) { create(:valid_user) }
    it 'returns http redirect' do
      sign_in user
      post :create, params: { chat_room: { chat_room: 1, member_type: 'member' } }
      expect(response).to have_http_status(:redirect)
    end
  end
end
