Rails.application.routes.draw do
  root 'pieces#home', as: 'home'
  get 'workshops/new'
  get 'workshops/show'
  get 'workshops/edit'
  get 'pieces/home'
  get 'pieces/index'
  get 'pieces/show'
  get 'pieces/new'
  get 'pieces/edit'
  devise_for :users
  resources :charges
end
