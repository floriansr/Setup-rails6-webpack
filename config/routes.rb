Rails.application.routes.draw do
 
  resources :images do
  	resources :comments
  end

  devise_for :users
  resources :users
  
  root 'images#index'
  get "/profile" => "static_pages#profile"
  get "/profile/images" => "static_pages#images"
  get "/profile/comments" => "static_pages#comments"

end