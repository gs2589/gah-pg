Rails.application.routes.draw do
  root to: 'home#index'

  resources :games, only: [:new, :create, :show, :destroy]
  get '/games/:id/results', to: 'games#results', as: "game_results"
    # resources :games, only: [:new, :create, :show, :destroy, :results],:has_many => [:comments]
  resources :rounds, only: :update do
    resources :selections, only: :create
  end
  resources :players, only: [:index,:create]
  resources :sessions, only: [:create]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

end
