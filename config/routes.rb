Rails.application.routes.draw do

  devise_for :users
  resources :chat_rooms, only: [:index, :show, :new, :create]

  get 'profile', to: 'users#show'

  root to: 'chat_rooms#index'

  mount ActionCable.server => '/cable'
end
