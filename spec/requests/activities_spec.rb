require 'rails_helper'

RSpec.describe "Activities", :type => :request do
  describe "GET /activities" do
    it " returns activities with authentication" do
      @current_user = create(:user)
      post user_session_path, { user: { login: @current_user.email, password:'12345678'} }
      get activities_path
      expect(response).to have_http_status(200)
    end

    it " redirects to login with no authentication" do
      get activities_path
      expect(response).to have_http_status(302)
    end

  end
end
