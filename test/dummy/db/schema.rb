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

ActiveRecord::Schema.define(version: 2018_05_31_183513) do

  create_table "access_grants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "token", null: false
    t.datetime "expires_at", null: false
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.index ["token"], name: "idx_access_grants_on_token"
    t.index ["user_id"], name: "idx_access_grants_on_user_id"
  end

  create_table "access_tokens", force: :cascade do |t|
    t.integer "user_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.datetime "expires_at", null: false
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["token"], name: "idx_access_tokens_on_token"
    t.index ["user_id"], name: "idx_access_tokens_on_user_id"
  end

  create_table "account_users", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "user_id", null: false
    t.boolean "default", default: true
    t.integer "role"
    t.index ["account_id"], name: "idx_account_users_on_account_id"
    t.index ["default"], name: "idx_account_users_on_default"
    t.index ["user_id"], name: "idx_account_users_on_user_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.boolean "active"
    t.integer "created_by_id", limit: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "idx_accounts_on_active"
    t.index ["created_at"], name: "idx_accounts_created_at"
    t.index ["slug"], name: "idx_accounts_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "time_zone", default: "America/New_York", null: false
    t.string "locale", default: "en", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
