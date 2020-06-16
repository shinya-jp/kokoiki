Rails.application.routes.draw do

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  get 'home/about'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  get 'users/:id/quit' => 'users#quit', as:'quit'

  resources :places, only: [:new, :create, :show] do
    resources :reviews
    get 'reviews/confirm' => 'reviews#confirm', as: 'review_confirm'
  end


end
