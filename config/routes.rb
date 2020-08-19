Rails.application.routes.draw do


  devise_for :users
  root 'samples#index'

  resources :samples, only: [:new, :create] do
    collection do
      get 'search'
    end
  end

  
  resources :samples, only: [:new, :create] do
    collection do
      get 'search'
    end
  end

  resources :users, only: [:edit, :update]



end
