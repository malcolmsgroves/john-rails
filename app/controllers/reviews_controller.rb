class ReviewsController < ApplicationController
  def create
    Review.create!(review_params)
    respond_to do |format|
      format.js
    end
  end

  private
    def review_params
      params.require(:review).permit(:name, :rating, :toilet_id)
    end
end
