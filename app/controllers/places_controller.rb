class PlacesController < ApplicationController
  before_action :check_search_params, only: :confirm

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
    @rate_avg = @reviews.average(:rate).round(1)
  end

  def confirm
    @place = Place.new
    @q = Place.search(search_params)
    @places = @q.result
    # ransackで検索したものを関連付ける
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

  # お店の検索で空白入力を防ぐ
  def check_search_params
    if search_params['name_eq'].blank? || search_params['prefecture_eq'].blank? || search_params['genre_eq'].blank?
      redirect_to new_place_path, notice: '必須項目を記入してください'
    end
  end
end
