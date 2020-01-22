require 'rails_helper'

RSpec.describe "ChatMembers", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/chat_members/create"
      expect(response).to have_http_status(:success)
    end
  end

end
