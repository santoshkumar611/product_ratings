require "test_helper"

class ProductTest < ActiveSupport::TestCase

  test "product creation successfull" do
    product = products(:one)
    product.name = "Product K"
    assert product.save, "Product is created"
    assert_equal "Product K", product.name
  end  
  

  test "product  creation failure when Description is not given" do
    product = products(:two)
    assert_equal false, product.valid?, "Product is not created"
    assert_equal("Description can't be blank", product.errors.full_messages.to_sentence)
  end

  test "product  creation failure when Name is not given" do
    product = products(:three)
    assert_equal false, product.valid?, "Product is not created"
    assert_equal("Name can't be blank", product.errors.full_messages.to_sentence)
  end




end
