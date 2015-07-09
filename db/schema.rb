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

ActiveRecord::Schema.define(version: 20150709035924) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "account",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "game_authors", force: :cascade do |t|
    t.integer  "game_id",    limit: 4, null: false
    t.integer  "author_id",  limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "game_authors", ["author_id"], name: "index_game_authors_on_author_id", using: :btree
  add_index "game_authors", ["game_id"], name: "index_game_authors_on_game_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.binary   "image",       limit: 65535
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,                   null: false
    t.string   "sha256_cookie", limit: 255,                 null: false
    t.boolean  "finish",        limit: 1,   default: false, null: false
    t.string   "remote_ip",     limit: 255,                 null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
