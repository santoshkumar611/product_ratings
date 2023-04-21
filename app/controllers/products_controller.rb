class ProductsController < ApplicationController
  
  def index
    products = Product.select("products.id, products.name, products.description, products.thumbnail_image, AVG(reviews.rating) as overall_rating ").
               joins(:reviews).group("products.id")
    render json: {success: true, products: products}
  end
end
