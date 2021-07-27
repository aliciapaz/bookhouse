class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_cart
  before_action :check_balance

  def checkout
    @cart_total = current_user.cart_total_price
    authorize :purchase, :checkout?
  end

  def confirm_purchase
    current_user.purchase_cart_books!
    render json: current_user.balance, status: :ok
    redirect_to "home/confirmation"
    authorize :purchase, :confirm_purchase?
  end

  private
    def check_cart
      return if current_user.find_cart_books.present?

      redirect_to books_url, alert: "Please add some books to your cart before processing your transaction!"
    end

    def check_balance
      return unless current_user.cart_total_price > current_user.balance

      redirect_to cart_path(current_user.id), alert: "Oops, looks like your balance is not enough to pay. Please transfer money to your balance before processing your transaction."
    end
end
