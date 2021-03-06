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

ActiveRecord::Schema.define(version: 20161030114607) do

  create_table "numbers", force: :cascade do |t|
    t.integer  "hours"
    t.string   "participation_key"
    t.integer  "poll_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["poll_id"], name: "index_numbers_on_poll_id"
  end

  create_table "participation_tokens", force: :cascade do |t|
    t.string   "participation_key"
    t.integer  "poll_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["poll_id"], name: "index_participation_tokens_on_poll_id"
  end

  create_table "polls", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "instant_result"
    t.boolean  "public_result"
    t.boolean  "open"
    t.string   "answer_type"
    t.integer  "participants"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
