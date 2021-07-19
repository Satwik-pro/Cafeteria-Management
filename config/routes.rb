Rails.application.routes.draw do
  get "/", to: "home#index"
  post "users/login", to: "users#login"
  resources :users
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  resources :admins
  resources :order_items
  resources :orders
  post "/all_orders", to: "all_orders#show"
  get "/all_orders", to: "all_orders#index"
  resources :all_orders
  resources :menu_items
  resources :menu_categories
  get "/items", to: "items#show"
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
