class BookCopy < ApplicationRecord
  belongs_to :book
  has_many :borrowing_records
end
