Rails.application.routes.draw do
  resources :home, only: [:index, :destroy]
  resources :users, only: [:index, :show]
  resources :invitations
  resources :posts 
  resources :comments
  post "/home", to: "likes#create"
  delete "/home", to: "likes#destroy"


  devise_for :users, controllers: { users: 'users'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
