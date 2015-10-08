Rails.application.routes.draw do
  resources :gadgets 

  devise_for :users

  root to: "gadgets#index"
end
