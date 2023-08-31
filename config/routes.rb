Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:index, :show, :create]

  resources :rooms

  resources :tracks, only: [:index] do
    collection do
      get :search
    end
  end

  get '/callback', to: 'tracks#callback'
end
