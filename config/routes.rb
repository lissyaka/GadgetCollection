Rails.application.routes.draw do
  resources :gadgets 

  devise_for :users
  get 'home/index'

  root to: "home#index"
end
