Rails.application.routes.draw do
  root 'chatrooms#index'
  devise_for :users

  resources :chatrooms, param: :id
  resources :messages

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :chatrooms
      resources :messages
    end
  end

  mount ActionCable.server => '/cable'
end
