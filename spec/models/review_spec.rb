require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:product) { Product.create(name: "Test product", description: " sample product good one") }

  it "is not valid without a reviewer name" do 
    review = Review.new(content: "Sample", rating: 2, product: product)
    expect(review).to_not be_valid
    expect(review.errors.full_messages.to_sentence).to eq("Reviewer name can't be blank")
  end

  it "is not valid without a rating" do
    review = Review.new(content: "Sample", reviewer_name: "Qa engineer", product: product)
    expect(review).to_not be_valid
    expect(review.errors.full_messages.to_sentence).to eq("Rating is not a number")
  end

  it "is not valid without a product" do
    review = Review.new(content: "Sample", reviewer_name: "Qa engineer", rating: 2)
    expect(review).to_not be_valid
    expect(review.errors.full_messages.to_sentence).to eq("Product must exist")
  end

  it "is valid" do
    review = Review.new(content: "Sample", reviewer_name: "Qa engineer", product: product, rating: 1)
    expect(review).to be_valid
    expect(review.save).to eq(true)
    expect(product.reviews.average(:rating)).to eq(1)
  end

  
  it "is not valid with a rating greater than 5" do
    review = Review.new(content: "Sample", reviewer_name: "Qa engineer", product: product, rating: 6)
    expect(review).to_not be_valid
    expect(review.errors.full_messages.to_sentence).to eq("Rating must be less than or equal to 5")
  end

  it "is not valid with a rating less than 1" do
    review = Review.new(content: "Sample", reviewer_name: "Qa engineer", product: product, rating: 0)
    expect(review).to_not be_valid
    expect(review.errors.full_messages.to_sentence).to eq("Rating must be greater than or equal to 1")
  end 


  it "overal rating should be correct" do 
    sum = 0 
    5.times do  
      random_rating = rand(1..5)
      sum += random_rating
      Review.create(content: "Sample", reviewer_name: "Qa engineer", product: product, rating: random_rating) 
    end
    expect(product.reviews.count).to eq(5)
    expect(product.reviews.average(:rating).to_f).to eq(sum.to_f/5)
  end 
end
