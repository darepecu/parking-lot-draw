Rails.application.routes.draw do
  resources :raffles
  resources :parkings
  resources :applicants

  root 'home#index'

  get 'home/index', to: 'home#index'

end
