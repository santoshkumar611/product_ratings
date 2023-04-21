require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "POST /create" do
    let(:product) { Product.create(name: "Test product", description: " sample product good one") }

    it "returns http success" do
      post "/reviews", params:  {review: {reviewer_name: "QA", content: "sample", rating: 2, product_id: product.id}}
      expect(product.reviews.count).to eq(1)
      expect(response).to have_http_status(:success)
    end
  end

end
