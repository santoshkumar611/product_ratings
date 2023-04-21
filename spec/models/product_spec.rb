require 'rails_helper'

RSpec.describe Product, type: :model do
  
  it "is not valid without a description" do 
    product = Product.new(name: "Sample")
    expect(product).to_not be_valid
    expect(product.errors.full_messages.to_sentence).to eq("Description can't be blank")
  end

  it "is not valid without a name" do
    product = Product.new(name: "", description: "empty product")
    expect(product).to_not be_valid
    expect(product.errors.full_messages.to_sentence).to eq("Name can't be blank")
  end

  it "is valid" do
    product = Product.new(name: "Sample", description: "good product")
    expect(product).to be_valid
    expect(product.save).to eq(true)
    expect(Product.count).to eq(1)
  end

  
end
