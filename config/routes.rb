Rails.application.routes.draw do
  # twitter認証
  post 'oauth/callback',  to: 'oauths#callback'
  get  'oauth/callback',  to: 'oauths#callback'
  get  'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  get 'likes/create'
  get 'likes/destroy'
  root 'boards#top'

  resources :users, only: [:new, :create, :show] do
    member do
      get :following, :followers
    end
  end

  resources :boards do
    collection { get "search" }
    resources :comments, only: [:create, :destroy], shallow: true
    resource :likes, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
end
