Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  #ログイン/ログアウト
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #新規登録
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]

  # Defines the root path route ("/")
  # root "articles#index"
end
