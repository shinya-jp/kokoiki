Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  get 'home/about'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :quit
    end
    member do
      get :following, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end

  resources :places, only: [:new, :create, :show] do
    collection do
      get :confirm
    end
    resources :reviews do
      collection do
        get :confirm
      end
      resources :review_comments, only: [:create, :destroy]
    end
  end
  # get 'places/confirm' => 'places#confirm'


end
