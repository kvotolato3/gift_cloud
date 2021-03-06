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

ActiveRecord::Schema.define(version: 20161209190307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claims", force: :cascade do |t|
    t.integer  "claimer_user_id"
    t.integer  "user_item_id"
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["claimer_user_id"], name: "index_claims_on_claimer_user_id", using: :btree
    t.index ["user_item_id"], name: "index_claims_on_user_item_id", using: :btree
  end

  create_table "occasion_user_items", force: :cascade do |t|
    t.integer  "occasion_id"
    t.integer  "user_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["occasion_id"], name: "index_occasion_user_items_on_occasion_id", using: :btree
    t.index ["user_item_id"], name: "index_occasion_user_items_on_user_item_id", using: :btree
  end

  create_table "occasion_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "occasion_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["occasion_id"], name: "index_occasion_users_on_occasion_id", using: :btree
    t.index ["user_id"], name: "index_occasion_users_on_user_id", using: :btree
  end

  create_table "occasions", force: :cascade do |t|
    t.integer  "creator_user_id"
    t.string   "name"
    t.date     "date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["creator_user_id"], name: "index_occasions_on_creator_user_id", using: :btree
  end

  create_table "user_items", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "claim_more_than_once"
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["user_id"], name: "index_user_items_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nickname"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "claims", "user_items"
  add_foreign_key "claims", "users", column: "claimer_user_id"
  add_foreign_key "occasion_user_items", "occasions"
  add_foreign_key "occasion_user_items", "user_items"
  add_foreign_key "occasion_users", "occasions"
  add_foreign_key "occasion_users", "users"
  add_foreign_key "occasions", "users", column: "creator_user_id"
  add_foreign_key "user_items", "users"
end
