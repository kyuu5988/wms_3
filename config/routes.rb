Rails.application.routes.draw do

  devise_for :users
  root 'samples#index'

  # ↓以前の設定 only: [:new, :create]
  resources :samples do
    #ロケ取引履歴を残す用(現在独自ルート利用中)
    #resources :resumes#, only: :create
    resources :air_times, only: :create
    collection do
      get 'search'
    end
  end


  #独自アクション用

  #全てsample_idが必要なのでネストする
  resources :samples do
    #urlアクセスによる自動ロケ移動用
    get 'auto_move_ast' => 'samples#auto_move_ast'
    #現在自動移動のリンクを一つに制限し他条件でロケ情報を指定する仕様
    #get 'auto_move_cst' => 'samples#auto_move_cst'
    get 'auto_move_one_sty' => 'samples#auto_move_one_sty'
    #単品編集用
    patch 'update2' => 'samples#update2'

  end
  
  get 'rent_list' => 'samples#rent_list'


  #モード切替
  post 'mode' => 'users#mode'


  resources :users, only: [:edit, :update]

  #履歴用独自アクション
  get 'rireki' => 'resumes#rireki'



end
