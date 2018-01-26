Rails.application.routes.draw do
  get 'tasks/index'

  resources :tasks #:tags
  
  root 'tasks#index'
end
