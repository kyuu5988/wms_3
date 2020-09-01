Rails.application.routes.draw do

  devise_for :users
  root 'samples#index'

  # ↓以前の設定 only: [:new, :create]
  resources :samples do
    collection do
      get 'search'
    end
  end

  #独自アクション用

  #全てsample_idが必要なのでネストする
  resources :samples do
    #urlアクセスによる自動ロケ移動用
    get 'auto_move_ast' => 'samples#auto_move_ast'
    get 'auto_move_cst' => 'samples#auto_move_cst'
    get 'auto_move_one_sty' => 'samples#auto_move_one_sty'
    #単品編集用
    patch 'update2' => 'samples#update2'

  end
  
  get 'rent_list' => 'samples#rent_list'



  resources :users, only: [:edit, :update]



end
