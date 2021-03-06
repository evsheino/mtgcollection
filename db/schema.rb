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

ActiveRecord::Schema.define(version: 20140817174033) do

  create_table "cards", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expansions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "loans", force: true do |t|
    t.integer  "printing_id"
    t.integer  "number"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "borrower_name"
    t.string   "owner_name"
    t.integer  "borrower_id"
    t.integer  "owner_id"
    t.boolean  "foil"
  end

  create_table "owned_cards", force: true do |t|
    t.integer  "printing_id"
    t.integer  "user_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "foil",        default: false, null: false
    t.string   "condition"
    t.string   "note"
  end

  create_table "payments", force: true do |t|
    t.integer  "trade_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printings", force: true do |t|
    t.integer  "card_id"
    t.integer  "expansion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "multiverse_id"
  end

  create_table "traded_cards", force: true do |t|
    t.integer  "trade_id"
    t.integer  "printing_id"
    t.boolean  "foil",        default: false, null: false
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "signed",      default: false, null: false
    t.boolean  "altered",     default: false, null: false
  end

  create_table "trades", force: true do |t|
    t.integer  "user_id"
    t.string   "partner"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.boolean  "closed",     default: false, null: false
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
