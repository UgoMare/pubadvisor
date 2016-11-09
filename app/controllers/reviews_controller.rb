class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @pub = Pub.find(params[:pub_id])
    @review.pub = @pub
    @review.save
    redirect_to pub_path(@pub)
  end


  private
  def review_params
    params.require(:review).permit(:content, :stars)
  end

end
