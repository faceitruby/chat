
describe "GET '/auth/google_oauth2/callback'" do
  it "should status :found" do
    get user_google_oauth2_omniauth_authorize_path
    expect(response).to have_http_status(:found)
  end
end
