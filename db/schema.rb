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

ActiveRecord::Schema.define(version: 20170529122032) do

  create_table "courses", force: true do |t|
    t.string "title"
    t.string "desc"
  end

  create_table "tests", force: true do |t|
    t.string  "title"
    t.string  "desc"
    t.integer "mark_max"
    t.integer "duration"
  end

  create_table "user_courses", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "passed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_tests", force: true do |t|
    t.integer  "user_id"
    t.integer  "test_id"
    t.integer  "mark"
    t.boolean  "passed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "pass"
    t.string   "fio"
    t.integer  "permission", default: 10
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
