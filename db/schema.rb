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

ActiveRecord::Schema.define(version: 20140922024033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisers", force: true do |t|
    t.string   "company",      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "postcode"
    t.string   "country_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      null: false
  end

  add_index "advertisers", ["user_id"], name: "index_advertisers_on_user_id", using: :btree

  create_table "campaigns", force: true do |t|
    t.string   "name",                          null: false
    t.integer  "budget",        default: 0,     null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "link"
    t.string   "country_code"
    t.string   "creative"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "advertiser_id",                 null: false
    t.boolean  "in_pause",      default: false, null: false
  end

  add_index "campaigns", ["advertiser_id"], name: "index_campaigns_on_advertiser_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",                              null: false
    t.string   "last_name",                               null: false
    t.string   "role",                   default: "user", null: false
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,      null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
