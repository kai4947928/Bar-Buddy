Rails.application.routes.draw do
  root 'home#index'
  resources :cocktails, only: [:index]
end
