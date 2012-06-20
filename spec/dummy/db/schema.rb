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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120619132558) do

  create_table "alohomora_clients", :force => true do |t|
    t.string   "uri"
    t.string   "name"
    t.integer  "created_from"
    t.string   "secret"
    t.string   "site_uri"
    t.string   "redirect_uri"
    t.string   "info"
    t.integer  "granted_times"
    t.integer  "revoked_times"
    t.date     "blocked"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "alohomora_oauth_accesses", :force => true do |t|
    t.string   "client_uri"
    t.string   "resource_owner_uri"
    t.date     "blocked"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "alohomora_oauth_authorizations", :force => true do |t|
    t.string   "client_uri"
    t.string   "resource_owner_uri"
    t.string   "code"
    t.time     "expired_at"
    t.date     "blocked"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "alohomora_oauth_daily_requests", :force => true do |t|
    t.time     "created_at", :null => false
    t.time     "time_id"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.integer  "times"
    t.datetime "updated_at", :null => false
  end

  create_table "alohomora_oauth_refresh_tokens", :force => true do |t|
    t.string   "refresh_token"
    t.string   "access_token"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "alohomora_oauth_tokens", :force => true do |t|
    t.string   "client_uri"
    t.string   "resource_owner_uri"
    t.string   "token"
    t.string   "refresh_token"
    t.date     "expire_at"
    t.date     "blocked"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "alohomora_scopes", :force => true do |t|
    t.string   "name"
    t.string   "uri"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "uri"
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
