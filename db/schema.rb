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

ActiveRecord::Schema.define(version: 20160804133737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.integer "width"
    t.integer "height"
    t.string  "link"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "messageable_id"
    t.string  "messageable_type"
    t.integer "sender_id"
    t.integer "recipient_id"
  end

  add_index "messages", ["messageable_type", "messageable_id"], name: "index_messages_on_messageable_type_and_messageable_id", using: :btree

  create_table "texts", force: :cascade do |t|
    t.text "body"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

  create_table "videos", force: :cascade do |t|
    t.integer "length"
    t.string  "source"
    t.string  "link"
  end

end
