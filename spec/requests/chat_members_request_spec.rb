require 'rails_helper'

RSpec.describe ChatMembersController, type: :request do
  describe 'post /create' do
    it 'returns http success' do
      post :create, params: { chat_member: { chat_room: 1, member_type: 'member' } }
      expect(response).to have_http_status(:success)
    end
  end

  describe ChatMembersController, type: :routing do
    describe 'routing' do
      context 'have' do
        it { expect(post: '/chat_members').to route_to('chat_members#create') }
        it { expect(get: '/chat_members/new').to route_to('chat_members#new') }
        it do
          expect(delete: '/chat_members/1').to route_to(
            controller: 'chat_members',
            action: 'destroy',
            id: '1'
          )
        end
      end

      context 'not have' do
        it { expect(get: '/chat_members').to_not route_to('chat_members#index') }
        it { expect(get: '/chat_members/1').to_not route_to(action: :show, id: 1) }
        it { expect(patch: '/chat_members/1').to_not route_to(action: :update, id: 1) }
        it { expect(put: '/chat_members/1').to_not route_to(action: :update, id: 1) }
        it { expect(get: '/chat_members/1/edit').to_not route_to(action: :edit, id: 1) }
      end
    end
  end
end
