class PlacesController < ApplicationController
  def new
  	@place = Place.new
  end

  def create
  	@place = Place.new(place_params)
  	@place.save
  end
  def show
  end

  private
  def palace_params
  	params.require(:palace).premit(:name, :genre, :perfecture)
  end
end
