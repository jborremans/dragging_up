DraggingUp::Application.routes.draw do
  
  get "about_us/show"

  resources :orders, only: [:new, :create] do
    get 'express', on => :collection
  end
  
  resources :cartools, only: [:create, :destroy]

  post "cartool/create"
  # delete "cartool/delete"


  resources :carts
  
  get "sessions/new", :as => :signin
  post "sessions/create"
  get "sessions/destroy", as: :signout
  
  resources :tools
  resources :users
  
  root to: 'pages#home'
  
  get '/help' => 'pages#help', as: :help
  get '/contactontact' => 'pages#contact'
end
