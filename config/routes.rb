Rails.application.routes.draw do
  root to: 'home#index'

  resources :games
  resources :gifs
  resources :players
  resources :player_games
  resources :prompts
end
