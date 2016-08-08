Rails.application.routes.draw do
  root 'chats#index'

  resources :messages, only: [:create, :index]
  resources :images, only: [:create]
  resources :videos, only: [:create]
  resources :users, only: [:create, :new]
end
