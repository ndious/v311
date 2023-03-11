# typed: false

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#login'

  post '/login', to: 'home#login'
  get '/login', to: 'home#signin'
  get '/dashboard', to: 'home#dashboard'
  get '/s/:code_value', to: 'home#search'
  get '/create', to: 'home#create'
  get '/sheet', to: 'home#print_sheet'

  # Rooms routes
  get '/rooms', to: 'rooms#index'
  get '/room', to: 'rooms#new'
  post '/room', to: 'rooms#create'
  post '/room/:room_code', to: 'rooms#show'

  # Items routes
  get '/room/:room_id/items', to: 'items#index'
  post '/item/:item_code', to: 'items#show'
  post '/item', to: 'items#create'
end
