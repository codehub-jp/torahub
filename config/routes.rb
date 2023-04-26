Rails.application.routes.draw do
  get 'boards/create'
  get 'boards/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  #ログイン/ログアウト
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #新規登録
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]

  #退会
  delete 'users/:id', to: 'users#destroy', as: :delete_user

  #ユーザー編集
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # プロフィール更新処理のルーティング
  patch '/users/:id', to: 'users#update', as: 'update_user'

  #掲示板(board)の投稿機能
  resources :boards, only: [:create, :destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
