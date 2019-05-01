Rails.application.routes.draw do
  root 'pieces#home', as: 'home'
  get 'workshops/new'
  get 'workshops/show'
  get 'workshops/edit'
  
  devise_for :users

  resources :charges
  resources :pieces
end