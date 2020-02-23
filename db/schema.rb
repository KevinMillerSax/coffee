# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_23_230715) do

  create_table "conversations", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "created_at"], name: "index_conversations_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "conversation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"user_id\", \"conversation\", \"created_at\"", name: "index_replies_on_user_id_and_conversation_and_created_at"
    t.index ["conversation_id"], name: "index_replies_on_conversation_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "equipment"
    t.string "favorite_coffee"
    t.string "location"
    t.string "remember_digest"
    t.boolean "admin", default: false
  end

  add_foreign_key "conversations", "users"
  add_foreign_key "replies", "conversations"
  add_foreign_key "replies", "users"
end
