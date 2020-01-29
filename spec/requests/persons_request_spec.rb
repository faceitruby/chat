require 'rails_helper'

RSpec.describe 'Persons', type: :request do

  describe 'GET /profile' do
    it 'returns http success' do
      get '/persons/profile'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /persons/search_contacts' do
    let(:send_correct_query) { get '/persons/search_contacts', xhr: true, params: { search: 'text' } }
    let(:send_wrong_query) { get '/persons/search_contacts', xhr: true }

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
