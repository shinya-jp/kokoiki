Rails.application.routes.draw do
  get 'user/edit'
  devise_for :users
  root to: 'home#top'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
