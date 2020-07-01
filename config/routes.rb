Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  get 'home/about'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :timeline
      get :quit
      get :favorite
    end
    member do
      get :following, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end

  resources :places, only: [:index, :new, :create, :show] do
    collection do
      get :confirm
    end
    resources :reviews, only: [:new, :show] do
      # collection do
      #   get :confirm
      # end
      resource :favorites, only: [:create, :destroy]
      resources :review_comments, only: [:create, :destroy]
    end
  end
  get 'favorites/index'
end
