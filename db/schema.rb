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

ActiveRecord::Schema.define(version: 20150602091803) do

  create_table "comments", force: :cascade do |t|
    t.text     "text_content"
    t.string   "author_name",    limit: 50
    t.datetime "date_submitted"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "text_content"
    t.string   "image_path",   limit: 100
    t.string   "video_path",   limit: 100
    t.integer  "spark_count"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.decimal  "score"
    t.integer  "views"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.string   "about",      limit: 300
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "password",   limit: 50
  end

  create_table "vibes", force: :cascade do |t|
    t.string   "vibe",       limit: 20
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "vibes", ["post_id"], name: "index_vibes_on_post_id"
  add_index "vibes", ["user_id"], name: "index_vibes_on_user_id"

end
