class BorrowingRecord < ApplicationRecord
  belongs_to :book_copy
  belongs_to :borrower

  def due_date
    date_borrowed + 14.days if date_borrowed.present?
  end

  def returned?
    date_returned.present?
  end
end
