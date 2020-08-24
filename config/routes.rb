Rails.application.routes.draw do

  devise_for :users
  root 'samples#index'

  resources :samples, only: [:new, :create] do
    collection do
      get 'search'
    end
  end

  #urlアクセスによる自動更新用

  resources :samples do
    get 'auto_move_all' => 'samples#auto_move_all'
  end


  

  resources :users, only: [:edit, :update]



end
