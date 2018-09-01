Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/getProducts' => 'products#index'
  post '/addProduct' => 'products#create'

  get '/getCart' => 'carts#index'
  post '/addToCart' => 'carts#create'
end
