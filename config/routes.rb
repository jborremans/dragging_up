DraggingUp::Application.routes.draw do
  resources :tools

  resources :users

  root to: 'pages#home'
  get '/help' => 'pages#help', :as => :help
  get '/contact' => 'pages#contact'
end
