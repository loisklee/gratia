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

ActiveRecord::Schema.define(version: 20190802021149) do

  create_table "entries", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "gratitude1"
    t.string   "gratitude2"
    t.string   "gratitude3"
    t.string   "gratitude4"
    t.string   "gratitude5"
    t.string   "gratitude6"
    t.string   "gratitude7"
    t.string   "gratitude8"
    t.string   "gratitude9"
    t.string   "gratitude10"
    t.string   "reflection1"
    t.string   "reflection2"
    t.string   "reflection3"
    t.string   "reflection4"
    t.string   "reflection5"
    t.string   "hopes1"
    t.string   "hopes2"
    t.string   "hopes3"
    t.string   "hopes4"
    t.string   "hopes5"
    t.string   "thoughts"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
