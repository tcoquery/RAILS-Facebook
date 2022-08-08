Rails.application.routes.draw do
  root "posts#index"
  resources :invitations
  resources :posts 
  resources :comments
  resources :likes
  post 'likes/new', to: 'likes#create'
  delete 'likes/:id', to: 'likes#destroy'

  devise_for :users, controllers: { users: 'users'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  # Defines the root path route ("/")
  
end
