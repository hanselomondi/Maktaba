class Book < ApplicationRecord
    has_many :book_copies
    has_many :borrowings, through: :book_copies
end
