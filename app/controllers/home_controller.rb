class HomeController < ApplicationController
  def top
    @user = current_user
    @q = Place.ransack(params[:q])
    places_play = Place.where(genre: 1).each do |place_play|
      # Placeのレビューの平均点を取得
      place_play.average = place_play.average_review_rate
    end
    # 平均点が高い順に表示
    @places_play = places_play.sort_by { |place_play| place_play.average.to_i }.reverse

    places_meal = Place.where(genre: 2).each do |place_meal|
      place_meal.average = place_meal.average_review_rate
    end
    @places_meal = places_meal.sort_by { |place_meal| place_meal.average.to_i }.reverse
  end

  def about
  end
end
