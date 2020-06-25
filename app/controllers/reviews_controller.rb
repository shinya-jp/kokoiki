class ReviewsController < ApplicationController
  def index

  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end

  def new
    @place = Place.find(params[:place_id])
    @review = Review.new
    @review.review_images.build
  end

  def create
    @place = Place.find(params[:place_id])
    @review = Review.new(review_params)
    @review.place_id = @place.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to place_review_path(place_id: @place.id, id: @review.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :review_profile, :rate, review_images_images:[])
  end
end
