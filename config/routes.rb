Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }

  resources :posts do
    resources :comments, only: :create
  end

  resources :likes, only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
