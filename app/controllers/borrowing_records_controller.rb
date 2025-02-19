class BorrowingRecordsController < ApplicationController
  before_action :set_borrower, only: [:borrow, :return_book]

  def index
    @borrowing_records = BorrowingRecord.includes(:book_copy)
  end

  def new
    @borrower = Borrower.find(params[:borrower_id])
    @books = Book.includes(:book_copies).where(book_copies: { id: BookCopy.where.not(id: BorrowingRecord.where(date_returned: nil).select(:book_copy_id)) })
  end  

  def borrow
    book_copy = BookCopy.find(params[:book_copy_id])

    if book_copy.available?
      @borrower.borrowing_records.create(book_copy: book_copy, date_borrowed: Date.today)
      redirect_to borrower_borrowing_records_path(@borrower), notice: "Book borrowed successfully!"
    else
      redirect_to books_path, alert: "Book is already borrowed!"
    end
  end

  def return_book
    record = @borrower.borrowing_records.find_by(book_copy_id: params[:book_copy_id], date_returned: nil)

    if record
      record.update(date_returned: Date.today)
      redirect_to borrower_borrowing_records_path(@borrower), notice: "Book returned successfully!"
    else
      redirect_to borrower_borrowing_records_path(@borrower), alert: "Book was not borrowed or already returned!"
    end
  end

  private
  def set_borrower
    @borrower = Borrower.find(params[:borrower_id])
  end
end
