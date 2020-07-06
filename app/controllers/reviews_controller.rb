class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :show]

  def show
    @review = Review.find(params[:id])
    if @review.place_id == params[:place_id].to_i
      @place = @review.place
      @review_comments = @review.review_comments.reverse_order
      @review_comment = ReviewComment.new
    else
      redirect_to place_path(params[:place_id]), notice: '不正なURLです'
    end
  end

  def new
    @place = Place.find(params[:place_id])
    @review = Review.new
    (1..6).each do |i|
      @review.review_images.build
    end
  end

  def create
    @place = Place.find(params[:place_id])
    @review = Review.new(review_params)
    @review.place_id = @place.id
    @review.user_id = current_user.id
    if @review.save
      # コメント部分は複数画像に対応
      # @review.review_images.each do |ri|
      #   next if ri.image_id.nil?
      tags = Vision.get_image_data(@review.review_images[0])
      # tags = Vision.get_image_data(ri)
        tags.each do |tag|
          @review.tags.create(review_image_id: @review.review_images[0].id, name: tag)
        end
      redirect_to place_review_path(place_id: @place.id, id: @review.id)
    else
      render :new
    end
  end

  def edit
    @place = Place.find(params[:place_id])
    @review = Review.find(params[:id])
  end

  def update
  end

  def destroy
    @place = Place.find(params[:place_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(current_user)
  end

  def confirm
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :review_profile, :rate,
                                   review_images_attributes: [
                                     :image,
                                   ])
  end
end
