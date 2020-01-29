require 'rails_helper'

RSpec.describe PersonsController, type: :controller do

  describe 'GET /profile' do
    let!(:user) { create(:valid_user) }
    it 'returns http success' do
      get :profile, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end
end
