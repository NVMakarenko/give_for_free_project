# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'
  resources :products
  resources :wishlists
  get 'show_offers', to: 'products#show_offers'
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end
  devise_for :users
end
