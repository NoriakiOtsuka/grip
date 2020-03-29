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

ActiveRecord::Schema.define(version: 2020_03_26_053912) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "blogs", force: :cascade do |t|
    t.integer "tourist_id"
    t.integer "guide_id"
    t.string "title", null: false
    t.integer "region"
    t.string "image_id"
    t.text "body", null: false
    t.boolean "sender", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "tourist_id"
    t.integer "guide_id"
    t.integer "schedule_id"
    t.text "message", null: false
    t.boolean "sender", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guide_id"], name: "index_chats_on_guide_id"
    t.index ["schedule_id"], name: "index_chats_on_schedule_id"
    t.index ["tourist_id"], name: "index_chats_on_tourist_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "tourist_id"
    t.integer "guide_id"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guides", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birthday", null: false
    t.integer "gender", null: false
    t.text "address", null: false
    t.string "phone", null: false
    t.text "introduction"
    t.integer "region", default: 0
    t.string "profile_image_id"
    t.integer "status", default: 0, null: false
    t.index ["email"], name: "index_guides_on_email", unique: true
    t.index ["first_name"], name: "index_guides_on_first_name"
    t.index ["last_name"], name: "index_guides_on_last_name"
    t.index ["reset_password_token"], name: "index_guides_on_reset_password_token", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "tourist_id"
    t.integer "guide_id"
    t.date "plan"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan"], name: "index_schedules_on_plan"
  end

  create_table "tourist_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "tourist_id"
    t.integer "guide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tourists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birthday", null: false
    t.integer "gender", null: false
    t.string "nationality", null: false
    t.string "phone", null: false
    t.integer "status", default: 0, null: false
    t.text "introduction"
    t.string "profile_image_id"
    t.index ["email"], name: "index_tourists_on_email", unique: true
    t.index ["first_name"], name: "index_tourists_on_first_name"
    t.index ["last_name"], name: "index_tourists_on_last_name"
    t.index ["reset_password_token"], name: "index_tourists_on_reset_password_token", unique: true
  end

end
