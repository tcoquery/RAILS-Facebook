Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :invitations
  resources :posts 
  resources :comments
  post "/home", to: "likes#create"

  devise_for :users, controllers: { users: 'users'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
