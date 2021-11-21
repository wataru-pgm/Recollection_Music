Rails.application.routes.draw do
  root 'boards#top'

  resources :users, only: [:new, :create]
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :boards
end
