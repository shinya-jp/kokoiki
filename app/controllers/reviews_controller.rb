class ReviewsController < ApplicationController
  def index
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
    @age = ( Date.today.strftime("%Y%m%d").to_i - @user.birthday.strftime("%Y%m%d").to_i) / 10000
    @place = Place.find_by(id: params[:place_id])
  end

  def new
    @place = Place.find(params[:place_id])
    @review = Review.new
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
    params.require(:review).permit(:title, :body, :review_profile)
  end
end
