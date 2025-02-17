class CreateBorrowingRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :borrowing_records do |t|
      t.references :book_copy, null: false, foreign_key: true
      t.references :borrower, null: false, foreign_key: true
      t.date :date_borrowed
      t.date :date_returned

      t.timestamps
    end
  end
end
