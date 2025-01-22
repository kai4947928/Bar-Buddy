Rails.application.routes.draw do
  root 'home#index'
  get 'how_to_use', to: 'pages#how_to_use'
  get 'terms_of_service', to: 'pages#terms_of_service'
  get 'privacy_policy', to: 'pages#privacy_policy'

  resources :cocktails, only: [:index]
end
