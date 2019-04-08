# frozen_string_literal: true

Rails.application.routes.draw do
  resources :raffles do
    get 'summary', on: :collection
  end
  
  resources :parkings do
    get 'assigned', on: :collection
    get 'no_assigned', on: :collection
  end
  resources :applicants do
    get 'assigned', on: :collection
    get 'no_assigned', on: :collection
    get 'pending_assigned', on: :collection
  end

  root 'home#index'

  get 'home/index', to: 'home#index'
end
