class FavoritesController < ApplicationController

  def create
  	review = Review.find(params[:review_id])
  	favorite = current_user.favorites.new(review_id: review.id)
  	favorite.save
  	redirect_back(fallback_location: root_path)
  end

  def destroy
  	review = Review.find(params[:review_id])
  	favorite = current_user.favorites.find_by(review_id: review.id)
  	favorite.destroy
  	redirect_back(fallback_location: root_path)
  end
end
