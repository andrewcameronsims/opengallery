Rails.application.routes.draw do
  devise_for :users
  root 'pieces#home', as: 'home'
end
