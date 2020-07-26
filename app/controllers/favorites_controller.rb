class FavoritesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.new(review_id: @review)
    favorite.save
    return
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: @review)
    favorite.destroy
    return
  end
end
