Rails.application.routes.draw do
  namespace :api do #kaikki alla olevat menee polun alkuun /api
    resources :playlists, only: [:index, :create, :show, :update, :destroy] do
      post 'add_song', on: :member
      post 'remove_song', on: :member
    end

  resources :songs, only: [:create, :index]
  end
end