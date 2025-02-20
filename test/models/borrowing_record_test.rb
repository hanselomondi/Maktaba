require "test_helper"

class BorrowingRecordTest < ActiveSupport::TestCase
  def setup
    @borrower = Borrower.create(name: "John Doe", email: "john@example.com", phone: "123456789")
    @book = Book.create(title: "Ruby on Rails", author: "David Heinemeier Hansson", isbn: "1234567890")
    @book_copy = @book.book_copies.create(serial_number: "ABC123")
    @borrowing_record = BorrowingRecord.create(borrower: @borrower, book_copy: @book_copy, date_borrowed: Date.today)
  end

  test "should be valid with all attributes" do
    assert @borrowing_record.valid?
  end

  test "should have a due date 14 days after borrowing" do
    assert_equal Date.today + 14.days, @borrowing_record.due_date
  end

  test "should be marked as returned if date_returned is set" do
    @borrowing_record.update(date_returned: Date.today)
    assert @borrowing_record.returned?
  end
end
