Rails.application.routes.draw do
  get 'home/index'

  resources :games
  resources :gifs
  resources :players
  resources :player_games
  resources :prompts
end
