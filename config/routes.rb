Rails.application.routes.draw do
  root 'boards#top'

  resources :users, only: [:new, :create]
  resources :boards
end
