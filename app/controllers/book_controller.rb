class BookController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @seller = User.find(@book.seller_id)
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

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to @user, notice: "Book was successfully deleted"
  end

  private
    def book_params
      params.require(:book).permit(:title, :description, :author, :price)
    end
end
