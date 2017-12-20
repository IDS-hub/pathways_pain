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

ActiveRecord::Schema.define(version: 20171220154833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lang_areas", force: :cascade do |t|
    t.string "name"
    t.string "enum"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sessions_id"
    t.index ["area_id"], name: "index_lang_areas_on_area_id"
    t.index ["sessions_id"], name: "index_lang_areas_on_sessions_id"
  end

  create_table "pain_areas", force: :cascade do |t|
    t.bigint "areas_id"
    t.bigint "pains_id"
    t.bigint "users_id"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["areas_id"], name: "index_pain_areas_on_areas_id"
    t.index ["pains_id"], name: "index_pain_areas_on_pains_id"
    t.index ["users_id"], name: "index_pain_areas_on_users_id"
  end

  create_table "pains", force: :cascade do |t|
    t.string "name"
    t.bigint "users_id"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_pains_on_users_id"
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

  create_table "sessions", force: :cascade do |t|
    t.string "name"
    t.text "session_text"
    t.string "media_link"
    t.integer "position"
    t.integer "media_duration_sec"
    t.bigint "areas_id"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["areas_id"], name: "index_sessions_on_areas_id"
    t.index ["position"], name: "index_sessions_on_position", unique: true
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

  add_foreign_key "lang_areas", "areas"
  add_foreign_key "lang_areas", "sessions", column: "sessions_id"
  add_foreign_key "pain_areas", "areas", column: "areas_id"
  add_foreign_key "pain_areas", "pains", column: "pains_id"
  add_foreign_key "pain_areas", "users", column: "users_id"
  add_foreign_key "pains", "users", column: "users_id"
  add_foreign_key "session_histories", "sessions"
  add_foreign_key "session_histories", "users"
  add_foreign_key "sessions", "areas", column: "areas_id"
end
