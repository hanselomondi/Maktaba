class BookCopiesController < ApplicationController
  before_action :set_book, only: [:index, :new, :create]

  def index
    @book_copies = @book.book_copies
  end

  def new
    @book_copy = @book.book_copies.new
  end

  def create
    @book_copy = @book.book_copies.new(book_copy_params)
    if @book_copy.save
      redirect_to book_book_copies_path(@book), notice: "Book copy created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book_copy = BookCopy.find(params[:id])
  end

  def destroy
    @book_copy = BookCopy.find(params[:id])
    @book_copy.destroy
    redirect_to books_path, notice: "Book copy deleted successfully!"
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def book_copy_params
    params.require(:book_copy).permit(:serial_number)
  end
end
