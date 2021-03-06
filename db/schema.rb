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

ActiveRecord::Schema.define(version: 20161004005847) do

  create_table "members", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.boolean  "superadmin",      default: false
    t.boolean  "multibook",       default: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["username"], name: "index_members_on_username", unique: true
  end

  create_table "roomhistories", force: :cascade do |t|
    t.string   "number"
    t.string   "userid"
    t.date     "date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "partnersemails"
    t.datetime "time_from"
    t.datetime "time_to"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "number"
    t.string   "building"
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
