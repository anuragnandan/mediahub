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

ActiveRecord::Schema.define(version: 20171010155059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "book"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "company"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "file_attachments_count", default: 0
  end

  add_index "courses", ["name"], name: "index_courses_on_name", unique: true, using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "favorited_id"
    t.string   "favorited_type", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "favorites", ["favorited_id"], name: "index_favorites_on_favorited_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "file_attachments", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sha_1_hash"
    t.integer  "file_size"
    t.string   "content_type"
    t.string   "file_basename"
    t.integer  "position"
  end

  add_index "file_attachments", ["sha_1_hash"], name: "index_file_attachments_on_sha_1_hash", unique: true, using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "track_courses", force: :cascade do |t|
    t.integer  "track_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "track_courses", ["course_id"], name: "index_track_courses_on_course_id", using: :btree
  add_index "track_courses", ["track_id"], name: "index_track_courses_on_track_id", using: :btree

  create_table "tracks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.boolean  "enabled",                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "video_player_trackers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "file_attachment_id"
    t.integer  "left_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "video_player_trackers", ["file_attachment_id"], name: "index_video_player_trackers_on_file_attachment_id", using: :btree
  add_index "video_player_trackers", ["user_id"], name: "index_video_player_trackers_on_user_id", using: :btree

  add_foreign_key "favorites", "users"
  add_foreign_key "track_courses", "courses"
  add_foreign_key "track_courses", "tracks"
end
