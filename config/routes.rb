Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'tasks#index'
  
  resources :users
  resources :tasks

 
end
