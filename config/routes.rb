Rails.application.routes.draw do
  get 'followers/index'
  get 'likes/create'
  get 'likes/destroy'
  root 'boards#top'

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :boards do
    collection { get "search" }
    resources :comments, only: [:create, :destroy], shallow: true
    resource :likes, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
end
