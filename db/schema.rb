# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_26_051716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "worship_id", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["worship_id"], name: "index_comments_on_worship_id"
  end

  create_table "seals", force: :cascade do |t|
    t.string "category", null: false
    t.string "title"
    t.string "place"
    t.date "date", null: false
    t.json "images"
    t.integer "likes_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_seals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "avatar"
    t.text "introduce"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "worship_likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "worship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "worship_id"], name: "index_worship_likes_on_user_id_and_worship_id", unique: true
    t.index ["user_id"], name: "index_worship_likes_on_user_id"
    t.index ["worship_id"], name: "index_worship_likes_on_worship_id"
  end

  create_table "worships", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.string "place"
    t.text "content"
    t.date "date"
    t.json "images"
    t.float "rating"
    t.integer "likes_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_worships_on_user_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "worships"
  add_foreign_key "seals", "users"
  add_foreign_key "worship_likes", "users"
  add_foreign_key "worship_likes", "worships"
  add_foreign_key "worships", "users"
end
