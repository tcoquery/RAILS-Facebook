Rails.application.routes.draw do
  resources :home, only: [:index]
  resources :users, only: [:index]
  resources :invitations
  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: { users: 'users'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
