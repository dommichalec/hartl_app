Rails.application.routes.draw do

  get "/home", to: 'static_pages#home'
  get "/about", to: 'static_pages#about'
  get "/help", to: 'static_pages#help', as: "helf"
  get "/contact", to: 'static_pages#contact'
  get "/signup", to: "users#new", as: "new_user"
  post "/signup",  to: 'users#create'
  get "/signin", to: 'sessions#new'
  post "/signin", to: 'sessions#create'
  delete "/signout", to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'application#hello'
  root 'static_pages#home'

  # REST resources for GET POST PATCH DELETE
  resources :users
end
