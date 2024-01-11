Rails.application.routes.draw do
  devise_for :users
  resources :students
  get 'home/index'
  root 'home#index'
  get 'home/about'
end
