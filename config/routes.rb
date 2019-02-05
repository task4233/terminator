Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'
  get  'tasks/show'

end
