class HomeController < ApplicationController
  def top
    @q = Place.ransack(params[:q])
    @places_play = Place.where(genre: 1)
    @places_meal = Place.where(genre: 2)
  end

  def about
  end
end
