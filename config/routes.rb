DraggingUp::Application.routes.draw do
  resources :users

  root to: 'pages#home'
  get '/help' => 'pages#help', :as => :help
end
