class Borrower < ApplicationRecord
    has_many :borrowing_records, dependent: :destroy
    has_many :book_copies, through: :borrowing_records
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true, uniqueness: true

    def borrowed_books
        book_copies.joins(:borrowing_records).where(borrowing_records: { date_returned: nil }).distinct
    end
end
