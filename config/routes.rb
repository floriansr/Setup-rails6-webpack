Rails.application.routes.draw do
 
  resources :images do
  	resources :comments
  end

  devise_for :users
  resources :users
  
  root 'static_pages#home'
  get "/profile" => "static_pages#profile"
end