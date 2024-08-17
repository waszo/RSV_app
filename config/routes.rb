# frozen_string_literal: true

Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/new'
  get 'reservations/show'
  post 'reservations/confirm'
  post 'reservations/back'
  post 'reservations/complete'

  get 'rooms/index'
  get 'rooms/new'

  get 'users/profile'
  get 'users/edit_profile', to: 'users#edit_profile'
  get 'users/update'
  get 'users/login'
  get 'users/account'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users/sign_up' => 'devise/registrations#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'rooms#top'

  resources :rooms do
    collection do
      get 'search'
    end
  end

  resources :users, only: %i[edit update] do
    member do
      get 'edit_profile'
    end
  end

  resources :reservations

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
