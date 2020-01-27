require 'rails_helper'

RSpec.describe MessagesController, type: :request do

  describe 'GET /create' do
    it 'returns http success' do
      get '/messages/create'
      expect(response).to have_http_status(:success)
    end
  end

end
