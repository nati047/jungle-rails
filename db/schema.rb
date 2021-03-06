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

ActiveRecord::Schema.define(version: 20220110222608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collaborators", force: :cascade do |t|
    t.integer "collaborator_id"
    t.integer "map_id"
  end

  create_table "favorite_maps", force: :cascade do |t|
    t.integer "user_id"
    t.integer "map_id"
  end

  create_table "favourite_maps", force: :cascade do |t|
    t.integer "saved_from_map_id"
    t.integer "saved_to_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "item_price_cents"
    t.integer  "total_price_cents"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "maps", force: :cascade do |t|
    t.integer "creator_id"
    t.string  "name",        limit: 255,                                 null: false
    t.text    "description",             default: "Enter a description"
    t.string  "image_url",   limit: 255, default: "Enter a url"
    t.string  "latitude",    limit: 255
    t.string  "longitude",   limit: 255
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "total_cents"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "stripe_charge_id"
  end

  create_table "points", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.integer "map_id"
    t.text    "description"
    t.string  "title",       limit: 255
    t.string  "picture_url", limit: 255
  end

  create_table "points_of_interest", force: :cascade do |t|
    t.integer "map_id"
    t.text    "description",             default: "Enter a description"
    t.string  "title",       limit: 255,                                 null: false
    t.string  "picture_url", limit: 255, default: "Enter a url"
    t.integer "latitude",                                                null: false
    t.integer "longitude",                                               null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.integer  "price_cents"
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "favourite_maps", "maps", column: "saved_from_map_id", name: "favourite_maps_saved_from_map_id_fkey", on_delete: :cascade
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "points_of_interest", "maps", name: "points_of_interest_map_id_fkey", on_delete: :cascade
  add_foreign_key "products", "categories"
end
