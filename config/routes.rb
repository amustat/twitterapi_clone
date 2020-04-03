Rails.application.routes.draw do
  resources :direct_messages
  resources :relations
  resources :likes, :only => [:create, :destroy]
  resources :tweets
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id/likes" => "users#likes"
  get "relation/follow" => "relation#follow_list"
  get "relation/follower" => "relation#follower_list"

end
