Rails.application.routes.draw do
  get 'properties/new'
  get 'properties/edit'
  get 'properties/update'
  get 'properties/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "properties#index"
end
