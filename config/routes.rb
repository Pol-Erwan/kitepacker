Rails.application.routes.draw do
  

  root 'hostels#index'


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :options, only: [:create]
  resources :bookings, only: [:new, :create, :show]
  
  resources :bookings, only: [:show] do
    resources :orders, only: [:create]
  end

  resources :hostels, only: [:index, :show]
  resources :static_pages, only: [:index] #change path to options
  resources :teams, only: [:index]
  resources :contacts, only: [:index]

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  namespace :admin do
    root 'admins#index'
    resources :admins
    resources :users
    resources :bookings
    resources :orders
    resources :hostels
  end

end
