class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book.id)
  end

  def edit
  end

  def index
    @books = Book.all
    @user = current_user.id
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
  

end
