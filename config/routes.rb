Rails.application.routes.draw do
  get 'tasks/index'
  post '/' => 'tasks#create'
  delete '/' => 'tasks#destroy'

  resources :users do
    resources :tasks
  end
  
  root 'tasks#index'
end
