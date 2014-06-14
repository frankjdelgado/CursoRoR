# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140614142921) do

  create_table "books", force: true do |t|
    t.string   "title",        limit: 100, null: false
    t.string   "author"
    t.date     "publish_date"
    t.integer  "page_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.date     "start_date"
    t.date     "finish_date"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books_users", ["book_id"], name: "index_books_users_on_book_id", using: :btree
  add_index "books_users", ["user_id"], name: "index_books_users_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["book_id"], name: "index_comments_on_book_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "phone"
    t.string   "country"
    t.string   "city"
    t.integer  "zipcode"
    t.string   "line1"
    t.string   "line2"
    t.string   "url_gravatar"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
