Rails.application.routes.draw do
  resources :votes
  devise_for :users
  resources :restaurants
  
  root to: "restaurants#index"
  
  get '/upvote/:id', to: 'restaurants#vote_for_splitting', as: 'upvote'
 get '/downvote/:id', to: 'restaurants#vote_against_splitting', as: 'downvote'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
