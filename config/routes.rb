Rails.application.routes.draw do
  
  resources :favorites
  devise_for :users
  resources :restaurants
  resources :votes
  
  root to: "restaurants#index"
  
  get '/upvote/:id', to: 'restaurants#vote_for_restaurant', as: 'upvote'
  get '/downvote/:id', to: 'restaurants#vote_against_restaurant', as: 'downvote'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
