class BookController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = current_user.books.build
    @user = User.find(current_user.id)
  end

  def create
    @book = current_user.books.build(book_params)
    @user = User.find(current_user.id)

    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    @seller = User.find(@book.seller_id)
  end

  def update; end

  def destroy
    @book.destroy
    redirect_to @user, notice: "Book was successfully destroyed"
  end

  private
    def book_params
      params.require(:book).permit(:title, :description, :author, :price)
    end
end
