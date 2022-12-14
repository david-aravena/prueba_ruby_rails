Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "properties#index"

  #----------------------------------------------------------------------------
  #estas rutas debo refactorizarlas para que sean una sola
  get "/properties/index", to: "properties#index", as: "search_number_toilets"
  get "/properties/index", to: "properties#index", as: "search_number_rooms"
  get "/properties/index", to: "properties#index", as: "search_address"
  #-----------------------------------------------------------------------------

  get 'properties/new', to: 'properties#new', as: "new_property"
  post 'properties', to: 'properties#create'
  patch 'properties/update/:id', to: 'properties#update', as:"update_property" 

  

  get 'properties/edit/:id', to: 'properties#edit', as: 'edit_property'
  delete 'properties/delete/:id', to: 'properties#destroy', as: 'delete_property'
end
