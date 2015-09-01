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

ActiveRecord::Schema.define(version: 20150821103100) do

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "gender"
    t.date     "birthday"
    t.string   "hometown"
    t.string   "location"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.text     "dump_fb_data"
    t.text     "education"
    t.text     "work"
    t.integer  "marital_status"
    t.integer  "caste"
    t.integer  "subcaste"
    t.string   "gothram"
    t.string   "height"
    t.string   "weight"
    t.integer  "body_type"
    t.integer  "complexion"
    t.integer  "physical_status"
    t.string   "salary"
    t.integer  "food_habits"
    t.integer  "smoking"
    t.integer  "drinking"
    t.integer  "dosham"
    t.string   "star"
    t.string   "rashi"
    t.integer  "family_type"
    t.integer  "family_values"
    t.integer  "family_status"
  end

  add_index "candidates", ["user_id"], name: "index_candidates_on_user_id"

  create_table "user_search_preferences", force: :cascade do |t|
    t.integer  "caste_pref_wt",      default: 1
    t.integer  "height_pref_min"
    t.integer  "height_pref_max"
    t.integer  "height_pref_wt",     default: 1
    t.integer  "complexion_pref_wt", default: 1
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "user_search_preferences", ["user_id"], name: "index_user_search_preferences_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "auth_token"
    t.datetime "auth_expires_at"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["uid"], name: "index_users_on_uid"

end
