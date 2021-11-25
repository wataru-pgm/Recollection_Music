Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'boards#top'

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :users, only: [:new, :create]
  resources :boards do
    resources :comments, only: [:create, :destroy], shallow: true
    resource :likes, only: [:create, :destroy]
  end
end
