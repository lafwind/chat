Rails.application.routes.draw do
  devise_for :users
  resources :chat_rooms, only: [:index, :show, :new, :create]

  root to: 'chat_rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
