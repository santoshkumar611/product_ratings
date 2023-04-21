class ReviewsController < ApplicationController
  
  def create
    review = Review.create!(review_params)
    product = review.product

    render json: {success: true, message: "Review created successfully", 
                  product: {id: product.id, overall_rating: product.reviews.average(:rating)}
                 }
  rescue => e
    render json: {success: false, message: "Review not created", error: e.to_s}
  end

  private
  
  def review_params
    params.require(:review).permit(:reviewer_name, :content, :product_id, :rating)
  end
end
