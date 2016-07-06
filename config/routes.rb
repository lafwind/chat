Rails.application.routes.draw do

  devise_for :users
  resources :chat_rooms, only: [:index, :show, :new, :create]
  # get '/chat_rooms/:id', to: redirect('/chat_rooms/%{id}'), as: 'chat_room'

  get 'profile/:id', to: 'users#show', as: :profile


  authenticated :user do
    root to: 'chat_rooms#index', as: :authenticated_root
  end

  root to: 'static_pages#home'

  mount ActionCable.server => '/cable'
end
