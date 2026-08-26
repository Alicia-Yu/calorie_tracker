Rails.application.routes.draw do
  root "dashboard#index"
  resources :dashboard, only: [:index]
  resources :meals, only: [:create, :destroy]
  resources :habits, only: [:create, :update]
  resources :users, only: [:update]
  resources :notes, only: [:create, :update, :destroy]
  post "foods/chat", to: "foods#chat"
end