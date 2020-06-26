class ReviewCommentsController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    comment = current_user.review_comments.new(review_comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to place_review_path(place_id: review.place.id, id: review.id)
  end

  def destroy
    review = Review.find(params[:review_id])
    comment = current_user.review_comments.find_by(id: params[:id])
    comment.destroy
    redirect_to place_review_path(place_id: review.place.id, id: review.id)
  end

  private
  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end
