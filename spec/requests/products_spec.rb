require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/products"
      expect(response).to have_http_status(:success)
    end
  end

end
