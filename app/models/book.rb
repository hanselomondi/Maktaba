class Book < ApplicationRecord
    has_many :book_copies, dependent: :destroy
    has_many :borrowings, through: :book_copies

    validates :title, presence: true
    validates :author, presence: true
    validates :isbn, presence: true, uniqueness: true

    def available_copies
        book_copies.available
    end

    def borrowed_copies
        book_copies.borrowed
    end
    
    def to_s
        "#{title} by #{author}"
    end
end
