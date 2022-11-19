Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "properties#index"
  get 'properties/new', to: 'properties#new', as: "new_property"
  post 'properties', to: 'properties#create'
  patch 'properties/update/:id', to: 'properties#update', as:"update_property" 

  

  get 'properties/edit/:id', to: 'properties#edit', as: 'edit_property'
  get 'properties/delete/:id', to: 'properties#destroy', as: 'delete_property'
end
