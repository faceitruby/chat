Rails.application.routes.draw do
  get 'home_pages/index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  get 'persons/profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home_pages#index'
  resources :chat_members, only: %i[create new]
  resources :chat_rooms, only: %i[create show]
  resources :messages, only: %i[create new]
end
