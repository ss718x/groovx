Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:index, :show, :create]

  resources :rooms do
    resources :rooms_users, only: [:create, :destroy, :edit]
    resources :messages, only: :create
  end

  resources :tracks, only: [:index] do
    post 'add_track_to_queue', on: :collection
    collection do
      post :search
    end
  end

  resources :messages, only: :show

  get '/callback', to: 'tracks#callback'
  get '/my_rooms', to: 'rooms#my_rooms', as: 'my_rooms'

  get '/queued_songs', to: 'tracks#queued_songs'
end
