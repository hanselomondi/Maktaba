# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_17_214723) do
  create_table "book_copies", force: :cascade do |t|
    t.integer "book_id", null: false
    t.string "serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_copies_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "isbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "borrowers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "borrowing_records", force: :cascade do |t|
    t.integer "book_copy_id", null: false
    t.integer "borrower_id", null: false
    t.date "date_borrowed"
    t.date "date_returned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_copy_id"], name: "index_borrowing_records_on_book_copy_id"
    t.index ["borrower_id"], name: "index_borrowing_records_on_borrower_id"
  end

  add_foreign_key "book_copies", "books"
  add_foreign_key "borrowing_records", "book_copies"
  add_foreign_key "borrowing_records", "borrowers"
end
