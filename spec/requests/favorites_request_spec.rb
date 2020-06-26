require 'rails_helper'

RSpec.describe "Favorites", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/favorites/index"
      expect(response).to have_http_status(:success)
    end
  end

end
