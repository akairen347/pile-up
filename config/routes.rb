Rails.application.routes.draw do
  post "login" => "users#login"
  #OK
  get "login" => "users#login_form"
  #OK
  post "logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"

  post "users/create" => "users#create"
  
  #OK
  get "signup" => "users#new"
  
  #OK
  get "users/:id" => "users#show"

  get "posts/index" => "posts#index"
 
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"

  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" =>"posts#destroy"
  get "/" => "home#top"
  #OK
  get "about" => "home#about"
  #OK
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
