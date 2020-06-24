require 'rails_helper'

RSpec.describe "ReviewComments", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/review_comment/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/review_comment/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
