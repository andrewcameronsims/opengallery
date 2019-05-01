Rails.application.routes.draw do
  root 'home#home', as: 'home'
  
  devise_for :users

  resources :charges
  resources :pieces
  resources :workshops
end