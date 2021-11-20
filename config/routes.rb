Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  root 'boards#top'

  resources :users, only: [:new, :create]
  resources :boards
end
