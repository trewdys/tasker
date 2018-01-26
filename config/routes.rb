Rails.application.routes.draw do
  get 'tasks/index'
  post '/' => 'tasks#create'
  delete '/' => 'tasks#destroy'

  resources :tasks #:tags
  
  root 'tasks#index'
end
