class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    cart_ids = $redis.smembers current_user_cart
    @cart_books = Book.find(cart_ids)
    authorize :cart, :show?
  end

  def add
    $redis.sadd current_user_cart, params[:book_id]
    render json: current_user.cart_count, status: :ok
    @book = Book.find(params[:book_id])
    @book.taken!
    authorize :cart, :add?
  end

  def remove
    $redis.srem current_user_cart, params[:book_id]
    render json: current_user.cart_count, status: :ok
    @book = Book.find(params[:book_id])
    @book.available!
    authorize :cart, :remove?
  end

  private
    def current_user_cart
      "cart#{current_user.id}"
    end
end
