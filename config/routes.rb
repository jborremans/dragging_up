DraggingUp::Application.routes.draw do
  
  get "sessions/new"
  post "sessions/create"
  get "sessions/destroy"
  
  resources :tools

  resources :users

  
  root to: 'pages#home'
  
  get '/help' => 'pages#help', :as => :help
  get '/contact' => 'pages#contact'
end
