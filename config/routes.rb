Rails.application.routes.draw do
  get 'tasks/index'
  post '/' => 'tasks#create'
  delete '/' => 'tasks#destroy'
  patch 'users/:user_id/tags' => 'tags#update'

  resources :users do
    resources :tasks
    resources :tags
  end
  
  root 'tasks#index'
end
