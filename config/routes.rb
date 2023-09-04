Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:index, :show, :create]

  resources :rooms do
    resources :rooms_users, only: [:create, :destroy, :edit]
  end

  resources :tracks, only: [:index] do
    collection do
      post :search
    end
  end

  get '/callback', to: 'tracks#callback'

  # post '/room/:room_id/rooms_user', to: 'rooms_user#create', as: "add"
end
