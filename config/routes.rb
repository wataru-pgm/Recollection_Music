Rails.application.routes.draw do
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  get 'likes/create'
  get 'likes/destroy'
  root 'boards#top'

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :users
  resources :boards do
    resources :comments, only: [:create, :destroy], shallow: true
    resource :likes, only: [:create, :destroy]
  end
end
