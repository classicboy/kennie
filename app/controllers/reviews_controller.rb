class ReviewsController < ApplicationController
  def create_review
    @review = Review.create(text: params[:text], user_id: params[:user_id], product_id: params[:product_id])

    respond_to do |format|
      # render 'products/show'
      format.js
    end
  end
end