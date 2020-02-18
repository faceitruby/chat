Rails.application.routes.draw do
  get 'home_pages/index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks',
                                              sessions: 'users/sessions',
                                              registrations: 'users/registrations'}
  get 'persons/profile'
  get 'persons/search_contacts'
  put 'persons/account_recovery'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home_pages#index'
  resources :chat_members, only: %i[create new destroy]
  resources :chat_rooms, only: %i[create show index] do
    resources :messages, only: %i[create new]
  end
end
