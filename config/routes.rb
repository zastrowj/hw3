Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # Root route: show places list
  root to: 'places#index'

  # Places resource
  resources :places, only: [:index, :show, :new, :create]

  # Entries resource, nested under places
  resources :entries, only: [:new, :create]
end
