class BookCopy < ApplicationRecord
  belongs_to :book
  has_many :borrowing_records

  validates :serial_number, presence: true, uniqueness: true
  
  def available?
    # A book copy is available if there are no active borrowing records (i.e., no records where `date_returned` is nil)
    borrowing_records.where(date_returned: nil).empty?
  end
end
