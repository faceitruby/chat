require 'rails_helper'

RSpec.describe "HomePages", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/home_pages/index"
      expect(response).to have_http_status(:success)
    end
  end

end
