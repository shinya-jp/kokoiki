class PlacesController < ApplicationController
  def new
    @q = Place.ransack(params[:q])
  end

  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to new_place_review_path(place_id: @place.id)
  end

  def show
    @place = Place.find(params[:id])
    @reviews = @place.reviews.reverse_order
    @review = Review.find(params[:id])
    user = @review.user
    @age = ( Date.today.strftime("%Y%m%d").to_i - user.birthday.strftime("%Y%m%d").to_i) / 10000
  end

  def confirm
    @place = Place.new
    @q = Place.search(search_params)
    @places = @q.result
    @place.name = @q.name_eq
    @place.prefecture = @q.prefecture_eq
    @place.genre = @q.genre_eq
  end

  private
  def search_params
    params.require(:q).permit!
  end

  def place_params
    params.require(:place).permit(:name, :genre, :prefecture)
  end
end
