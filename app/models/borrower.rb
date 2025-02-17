class Borrower < ApplicationRecord
    has_many :borrowing_records
    has_many :book_copies, through: :borrowing_records
end
