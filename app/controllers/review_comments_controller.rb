class ReviewCommentsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @review = Review.find(params[:review_id])
    comment = current_user.review_comments.new(review_comment_params)
    comment.review_id = @review.id
    if comment.save
      render :index
    else
      @review_comment = ReviewComment.new
      @review_comments = @review.review_comments.reverse_order
      render template: "reviews/show"
    end
  end

  def destroy
    @place = Place.find(params[:place_id])
    @review = Review.find(params[:review_id])
    comment = current_user.review_comments.find_by(id: params[:id])
    comment.destroy
    render :index
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end
