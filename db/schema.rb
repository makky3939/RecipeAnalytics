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

ActiveRecord::Schema.define(version: 20141012160304) do

  create_table "ingredients", force: true do |t|
    t.integer  "recipe_id"
    t.string   "name"
    t.string   "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["id"], name: "index_ingredients_on_id", using: :btree
  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree

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
    t.string   "cooktime_id"
    t.string   "anytime_id"
    t.string   "money_id"
    t.string   "peoples"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes", ["id"], name: "index_recipes_on_id", using: :btree
  add_index "recipes", ["recipe_id"], name: "index_recipes_on_recipe_id", using: :btree
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "reports", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.string   "recommend"
    t.string   "response"
    t.string   "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["id"], name: "index_reports_on_id", using: :btree
  add_index "reports", ["recipe_id"], name: "index_reports_on_recipe_id", using: :btree
  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "steps", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "position"
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["id"], name: "index_steps_on_id", using: :btree
  add_index "steps", ["recipe_id"], name: "index_steps_on_recipe_id", using: :btree

end
