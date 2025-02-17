class BorrowingRecord < ApplicationRecord
  belongs_to :book_copy
  belongs_to :borrower
end
