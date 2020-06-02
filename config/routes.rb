Rails.application.routes.draw do
  resources :images
  devise_for :users
  resources :users
  root 'static_pages#home'
  get "/profile" => "static_pages#profile"
end