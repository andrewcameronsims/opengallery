# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#home', as: 'home'
  get '/about', to: 'home#about', as: 'about'
  get '/contact', to: 'home#contact', as: 'contact'

  devise_for :users

  resources :charges, only: [:create]
  resources :followers, only: %i[create destroy]
  resources :pieces
  resources :workshops
end
