Rails.application.routes.draw do
  devise_for :users

  root "application#index"

  resources :books
  # Get books of a given seller
  get "users/:id/books", to: "books#seller", as: "user_books"
end
