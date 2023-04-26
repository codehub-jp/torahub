Rails.application.routes.draw do
  get 'toppages/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  #Signup
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]

  # Defines the root path route ("/")
  # root "articles#index"
end
