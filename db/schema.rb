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

ActiveRecord::Schema.define(version: 20150515202912) do

  create_table "collections", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id"

  create_table "group_notes", force: true do |t|
    t.integer  "note_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "group_notes", ["group_id"], name: "index_group_notes_on_group_id"
  add_index "group_notes", ["note_id"], name: "index_group_notes_on_note_id"
  add_index "group_notes", ["user_id"], name: "index_group_notes_on_user_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id"

  create_table "notes", force: true do |t|
    t.integer  "user_id"
    t.integer  "start_time"
    t.text     "notes"
    t.string   "url"
    t.integer  "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time_stamp_h"
    t.integer  "time_stamp_m"
    t.integer  "time_stamp_s"
  end

  add_index "notes", ["collection_id"], name: "index_notes_on_collection_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "papers", force: true do |t|
    t.string   "name"
    t.text     "thesis"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "papers", ["user_id"], name: "index_papers_on_user_id"

  create_table "point_supports", force: true do |t|
    t.integer  "note_id"
    t.integer  "point_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "point_supports", ["note_id"], name: "index_point_supports_on_note_id"
  add_index "point_supports", ["point_id"], name: "index_point_supports_on_point_id"
  add_index "point_supports", ["user_id"], name: "index_point_supports_on_user_id"

  create_table "points", force: true do |t|
    t.integer  "paper_id"
    t.integer  "user_id"
    t.string   "description"
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points", ["paper_id"], name: "index_points_on_paper_id"
  add_index "points", ["user_id"], name: "index_points_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "user_name"
    t.string   "password_digest"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
