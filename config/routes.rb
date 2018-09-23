Rails.application.routes.draw do
  root 'chatrooms#index'
  devise_for :users

  resources :chatrooms do
    resources :messages
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :chatrooms
      resources :messages
    end
  end
end
