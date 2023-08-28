Rails.application.routes.draw do
  resources :controllers
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:index, :show, :create]

  resources :rooms
end
