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

ActiveRecord::Schema.define(version: 20150126200747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.string   "activity_img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities_users", force: true do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities_users", ["activity_id"], name: "index_activities_users_on_activity_id", using: :btree
  add_index "activities_users", ["user_id"], name: "index_activities_users_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "venue"
    t.string   "location"
  end

  add_index "events", ["activity_id"], name: "index_events_on_activity_id", using: :btree

  create_table "events_users", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events_users", ["event_id"], name: "index_events_users_on_event_id", using: :btree
  add_index "events_users", ["user_id"], name: "index_events_users_on_user_id", using: :btree

  create_table "flags", force: true do |t|
    t.text     "reason"
    t.integer  "reporter_id"
    t.integer  "flagged_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flags", ["flagged_id"], name: "index_flags_on_flagged_id", using: :btree
  add_index "flags", ["reporter_id"], name: "index_flags_on_reporter_id", using: :btree

  create_table "flakes", force: true do |t|
    t.integer  "event_id"
    t.integer  "nark_id"
    t.integer  "flaked_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flakes", ["event_id"], name: "index_flakes_on_event_id", using: :btree
  add_index "flakes", ["flaked_id"], name: "index_flakes_on_flaked_id", using: :btree
  add_index "flakes", ["nark_id"], name: "index_flakes_on_nark_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["event_id"], name: "index_messages_on_event_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "bio"
    t.string   "location"
    t.string   "profile_img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
