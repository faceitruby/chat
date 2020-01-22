Rails.application.routes.draw do
  get 'chat_rooms/create'
  get 'chat_members/create'
  get 'messages/create'
  get 'home_pages/index'
  devise_for :users
  get 'persons/profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home_pages#index'
end
