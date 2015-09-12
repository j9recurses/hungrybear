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

ActiveRecord::Schema.define(version: 20150911085014) do

  create_table "cafes", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.text    "description", limit: 65535
    t.string  "logo_img",    limit: 255
    t.string  "location",    limit: 255
    t.integer "mycafe_id",   limit: 4
  end

  create_table "food_genres", force: :cascade do |t|
    t.string  "name",             limit: 255
    t.text    "description",      limit: 65535
    t.integer "myfood_genres_id", limit: 4
    t.string  "foodgenre_img",    limit: 255
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.decimal  "price",                          precision: 10
    t.text     "description",      limit: 65535
    t.string   "food_genre_id",    limit: 255
    t.integer  "cafe_id",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mycafe_id",        limit: 4
    t.integer  "myfood_genres_id", limit: 4
    t.string   "menu_img",         limit: 255
  end

  create_table "orders", force: :cascade do |t|
    t.date     "pickup_dt"
    t.time     "pickup_time"
    t.integer  "menu_id",     limit: 4
    t.integer  "cafe_id",     limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string  "fn",       limit: 255
    t.string  "ln",       limit: 255
    t.string  "username", limit: 255
    t.integer "phone",    limit: 4
    t.string  "email",    limit: 255
    t.string  "role",     limit: 255
  end

end
