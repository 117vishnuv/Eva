Rails.application.routes.draw do
  devise_for :users
  resources  :users
  resources  :follows
  resources  :events
  resources  :home
  
  # resources :notifications do
    # collection do
      # post :mark_as_read
    # end
  # end

  get '/notifications' , to: "notifications#index", as: "notifications"
  post '/users/:id/follow',   to: "users#follow",   as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  get '/search' , to: 'home#index' , as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # root to: "home#index"
end
