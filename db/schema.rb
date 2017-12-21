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

ActiveRecord::Schema.define(version: 20171221102153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pain_causes", force: :cascade do |t|
    t.string "name"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "session_histories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "session_id"
    t.boolean "is_completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_session_histories_on_session_id"
    t.index ["user_id"], name: "index_session_histories_on_user_id"
  end

  create_table "session_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "pain_cause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pain_cause_id"], name: "index_session_lists_on_pain_cause_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "name"
    t.text "session_text"
    t.string "media_link"
    t.integer "position"
    t.integer "media_duration_sec"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lang", default: 0
    t.bigint "session_lists_id"
    t.index ["session_lists_id"], name: "index_sessions_on_session_lists_id"
  end

  create_table "user_pain_causes", force: :cascade do |t|
    t.bigint "pain_causes_id"
    t.bigint "users_id"
    t.integer "pain_level"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pain_causes_id"], name: "index_user_pain_causes_on_pain_causes_id"
    t.index ["users_id"], name: "index_user_pain_causes_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "access_token"
    t.string "reset_password_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "salt", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "session_histories", "sessions"
  add_foreign_key "session_histories", "users"
  add_foreign_key "session_lists", "pain_causes"
  add_foreign_key "sessions", "session_lists", column: "session_lists_id"
  add_foreign_key "user_pain_causes", "pain_causes", column: "pain_causes_id"
  add_foreign_key "user_pain_causes", "users", column: "users_id"
end
