require 'rails_helper'

RSpec.describe PersonsController, type: :controller do

  describe 'GET /profile' do
    let!(:user) { create(:valid_user) }
    it 'returns http success' do
      get :profile, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'routing' do
    it { is_expected.to_not route(:get,    '/persons').to(action: :index) }
    it { is_expected.to_not route(:post,   '/persons').to(action: :create) }
    it { is_expected.to_not route(:get,    '/persons/new').to(action: :new) }
    it { is_expected.to_not route(:get,    '/persons/1/edit').to(action: :edit, id: 1) }
    it { is_expected.to_not route(:get,    '/persons/1').to(action: :show, id: 1) }
    it { is_expected.to_not route(:patch,  '/persons/1').to(action: :update, id: 1) }
    it { is_expected.to_not route(:put,    '/persons/1').to(action: :update, id: 1) }
    it { is_expected.to_not route(:delete, '/persons/1').to(action: :destroy, id: 1) }

    it { is_expected.to route(:get,   '/persons/profile').to(action: :profile) }
    it { is_expected.to route(:get,   '/persons/search_contacts').to(action: :search_contacts) }
    it { is_expected.to route(:get,   '/persons/search_chats').to(action: :search_chats) }
  end

  describe 'GET /persons/search_contacts' do
    let(:send_correct_query) { get :search_contacts, xhr: true, params: { search: 'text' } }
    let(:send_wrong_query) { get :search_contacts, xhr: true }

    context 'with correct query' do
      before(:each) { send_correct_query }
      it 'return http success' do
        expect(response).to have_http_status(:success)
      end
      it 'response contains json' do
        expect(response.content_type).to include('application/json')
      end
      it 'response does not contain an empty body' do
        expect(response.body).not_to be_empty
      end
    end

    context 'with wrong query' do
      before(:each) { send_wrong_query }
      it 'return 422 without search parameter' do
        expect(response).to have_http_status(422)
      end
      it 'response does not contain json' do
        expect(response.content_type).not_to include('application/json')
      end
      it 'response contains an empty body' do
        expect(response.body).to be_empty
      end
    end
  end


  describe 'GET /persons/search_chats' do
    let(:send_correct_query) { get :search_chats, xhr: true, params: { search: 'text' } }
    let(:send_wrong_query) { get :search_chats, xhr: true }

    context 'with correct query' do
      before(:each) { send_correct_query }
      it 'return http success' do
        expect(response).to have_http_status(:success)
      end
      it 'response contains json' do
        expect(response.content_type).to include('application/json')
      end
      it 'response does not contain an empty body' do
        expect(response.body).not_to be_empty
      end
    end

    context 'with wrong query' do
      before(:each) { send_wrong_query }
      it 'return 422 without search parameter' do
        expect(response).to have_http_status(422)
      end
      it 'response does not contain json' do
        expect(response.content_type).not_to include('application/json')
      end
      it 'response contains an empty body' do
        expect(response.body).to be_empty
      end
    end
  end
end
