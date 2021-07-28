class BooksController < ApplicationController
  def index
    if params[:search_by_title].present?
      @book_search = Book.available.search_by_title(params[:search_by_title])
      @books = @book_search.order(created_at: :desc).page(params[:page]).per(6)
    else
      @books = Book.available.order(created_at: :desc).page(params[:page]).per(6)
    end
  end

  def show
    @book = Book.find(params[:id])
    @seller = User.find(@book.seller_id)
    @cart_action = @book.cart_action current_user.try :id
  end

  def new
    @book = current_user.books.build
    @user = User.find(current_user.id)
    authorize @book
  end

  def create
    @book = current_user.books.build(book_params)
    @user = User.find(current_user.id)
    authorize @book

    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    authorize @book
  end

  def update
    @book = Book.find(params[:id])
    authorize @book

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

  # Show books of a given seller
  def seller
    @seller = User.find(params[:id])
    @books = Book.available.where(seller_id: params[:id]).order(created_at: :desc).page(params[:page]).per(6)
    render "books_by_seller"
  end

  # Show a seller their sold books
  def overview
    book_ids = Book.sold.where(seller_id: current_user.id).ids
    @sales = Purchase.includes(:book, :buyer).where(book_id: book_ids)
    render "seller_overview"
  end

  private
    def book_params
      params.require(:book).permit(:title, :description, :author, :price, :image, :search_by_title)
    end
end
