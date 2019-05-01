Rails.application.routes.draw do
  root 'pieces#home', as: 'home'
  
  devise_for :users

  resources :charges
  resources :pieces
  resources :workshops
end