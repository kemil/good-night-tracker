Rails.application.routes.draw do
  resources :follows
  resources :clocked_ins
  resources :users

  post '/users/:id/follow/:following_id', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow/:following_id', to: "users#unfollow", as: "unfollow_user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
