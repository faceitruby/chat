require 'rails_helper'

RSpec.describe ChatRoomsController, type: :routing do
  describe 'routing' do
    context 'have' do
      it 'chat_rooms#create' do
        expect(post: '/chat_rooms').to route_to(
          controller: 'chat_rooms',
          action: 'create'
        )
      end

      it 'chat_rooms#index' do
        expect(get: '/chat_rooms').to route_to(
          controller: 'chat_rooms',
          action: 'index'
        )
      end

      it 'chat_rooms#show' do
        expect(get: '/chat_rooms/1').to route_to(
          controller: 'chat_rooms',
          action: 'show',
          id: '1'
        )
      end

      it 'chat_rooms#destroy' do
        expect(delete: '/chat_rooms/1').to route_to(
          controller: 'chat_rooms',
          action: 'destroy',
          id: '1'
        )
      end
    end

    context 'not have' do
      it 'chat_rooms#new' do
        expect(get: '/chat_rooms/new').to_not route_to(
          controller: 'chat_rooms',
          action: 'new'
        )
      end

      it 'chat_rooms#update' do
        expect(patch: '/chat_rooms/1').to_not route_to(
          controller: 'chat_rooms',
          action: 'update',
          id: '1'
        )
      end

      it 'chat_rooms#update' do
        expect(put: '/chat_rooms/1').to_not route_to(
          controller: 'chat_rooms',
          action: 'update',
          id: '1'
        )
      end

      it 'chat_rooms#edit' do
        expect(get: '/chat_rooms/1/edit').to_not route_to(
          controller: 'chat_rooms',
          action: 'edit',
          id: '1'
        )
      end
    end
  end
end

describe ChatRoomsController, type: :controller do
  context 'post /create' do
    let(:user) { create(:valid_user) }
    context 'success' do
      it 'returns http redirect' do
        sign_in user
        post :create, params: { chat_room: { chat_room: 1, member_type: 'member' } }
        expect(response).to have_http_status(:redirect)
      end

      it 'should create new chat room' do
        sign_in user
        expect do
          post :create, params: { chat_room: { chat_room: 1, member_type: 'member' } }
        end.to change(ChatRoom, :count).by(1)
      end

      it 'should create new chat member' do
        sign_in user
        expect do
          post :create, params: { chat_room: { chat_room: 1, member_type: 'member' } }
        end.to change(ChatMember, :count).by(1)
      end

      it 'should create new chat room with owner' do
        sign_in user
        post :create, params: { chat_room: { chat_room: 1, member_type: 'member' } }
        expect(ChatRoom.last.chat_members.last.member_type).to eq('owner')
      end
    end

    context 'not success' do
      it 'returns http 401 if user log_out' do
        post :create, params: { chat_room: { chat_room: 1, member_type: 'member' } }
        expect(response).to have_http_status(401)
      end
    end
  end

  context 'GET #index' do
    let(:user) { create(:valid_user) }
    it 'should success and render index page if user sign_in' do
      sign_in user
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it 'should redirect if user sign_out' do
      get :index
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(
        controller: 'devise/sessions',
        action: 'new'
      )
    end

    context 'actions' do
      %i[check_user chat_list chat_room].each do |action|
        it { is_expected.to use_before_action(action) }
      end
    end

    context 'instance variables' do
      %i[@chat_list @chat_members].each do |instance_variable|
        it do
          sign_in user
          get :index
          expect(@controller.instance_variable_get(instance_variable).class).to eq(Array)
        end
      end
    end
  end

  context 'GET #show' do
    let(:chat_room) { create(:chat_room) }
    let(:user) { create(:valid_user) }

    it 'should success and render index page if user sign_in' do
      sign_in user
      get :show, params: { id: chat_room.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it 'should redirect if user sign_out' do
      get :show, params: { id: chat_room.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(
        controller: 'devise/sessions',
        action: 'new'
      )
    end

    context 'instance variables' do
      %i[@chat_list @chat_members @chat_messages].each do |instance_variable|
        it do
          sign_in user
          get :show, params: { id: chat_room.id }
          expect(@controller.instance_variable_get(instance_variable).class).to eq(Array)
        end
      end

      it 'contein chat_room -- ChatRoom' do
        sign_in user
        get :show, params: { id: chat_room.id }
        expect(
          @controller.instance_variable_get(:@chat_room).class
        ).to eq(
          ChatRoom
        )
      end
    end
  end
end
