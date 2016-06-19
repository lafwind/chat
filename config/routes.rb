Rails.application.routes.draw do
  devise_for :users
  resources :chat_rooms, only: [:index, :show, :new, :create]

  root to: 'chat_rooms#index'

  mount ActionCable.server => '/cable'
end
