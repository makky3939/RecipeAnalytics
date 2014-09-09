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

ActiveRecord::Schema.define(version: 20140909023613) do

  create_table "ingredients", force: true do |t|
    t.integer  "recipe_id"
    t.string   "name"
    t.string   "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.string   "large_category"
    t.string   "medium_category"
    t.string   "small_category"
    t.string   "title"
    t.string   "preface"
    t.string   "introduce"
    t.string   "img_name"
    t.string   "name"
    t.string   "tag1"
    t.string   "tag2"
    t.string   "tag3"
    t.string   "tag4"
    t.string   "one_point"
    t.integer  "cooktime_id"
    t.string   "anytime_id"
    t.integer  "money_id"
    t.string   "peoples"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "position"
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
