Rails.application.routes.draw do
  
  resources :comments
  resources :favorites
  devise_for :users
  resources :restaurants
  resources :votes
  
  root to: "restaurants#index"
  
  get '/upvote/:id', to: 'restaurants#vote_for_restaurant', as: 'upvote'
  get '/downvote/:id', to: 'restaurants#vote_against_restaurant', as: 'downvote'
  get '/favorite_restaurant/:id', to: 'restaurants#favorite_a_restaurant', as: 'pick'
  get '/comment_restaurant/:id', to: 'comments#new', as: 'commenting'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
