Rails.application.routes.draw do
  devise_for :users
  resources  :users
  resources  :follows
  resources  :events
  resources  :home
  post '/users/:id/follow',   to: "users#follow",   as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # root to: "home#index"
end
