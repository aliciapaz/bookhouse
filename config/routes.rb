Rails.application.routes.draw do
  devise_for :users

  root "application#index"
  resource :cart, only: [:show] do
    put "add/:book_id", to: "carts#add", as: :add_to
    put "remove/:book_id", to: "carts#remove", as: :remove_from
  end

  resources :books
  # Get books of a given seller
  get "users/:id/books", to: "books#seller", as: "user_books"
end
