Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :invitations
  resources :posts 
  resources :comments
  resources :likes
  post 'likes/new', to: 'likes#create'
  delete 'likes/:id', to: 'likes#destroy'

  devise_for :users, controllers: { users: 'users'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
