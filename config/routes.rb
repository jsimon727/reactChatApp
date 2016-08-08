Rails.application.routes.draw do
  root 'chats#index'

  resources :messages, only: [:create, :show]
  resources :users, only: [:create, :new]
end
