Rails.application.routes.draw do


  devise_for :users
  root 'samples#index'
  resources :samples
  resources :users, only: [:edit, :update]



end
