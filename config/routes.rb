Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"

  #get "/books/index", to: "books#index"
  #get "/books/:id", to: "books#show"
  resources :books do
    resources :copies
  end
end
