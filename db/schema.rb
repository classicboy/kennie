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

ActiveRecord::Schema.define(version: 20160501165104) do

  create_table "books_categories", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "books_categories", ["book_id"], name: "index_books_categories_on_book_id"
  add_index "books_categories", ["category_id"], name: "index_books_categories_on_category_id"

  create_table "caetegories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "descrtiption"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id"

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id"
  add_index "order_products", ["product_id"], name: "index_order_products_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "delivered_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.integer  "status",       default: 0
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "product_collections", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "collection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "product_collections", ["collection_id"], name: "index_product_collections_on_collection_id"
  add_index "product_collections", ["product_id"], name: "index_product_collections_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.integer  "price"
    t.string   "image"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "is_new",     default: 0
  end

  create_table "products_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "products_categories", ["category_id"], name: "index_products_categories_on_category_id"
  add_index "products_categories", ["product_id"], name: "index_products_categories_on_product_id"

  create_table "reviews", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "role",                   default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
