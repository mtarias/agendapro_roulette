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

ActiveRecord::Schema.define(version: 20190715193721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "player_logs", force: :cascade do |t|
    t.string   "player_name"
    t.integer  "player_money_bet"
    t.string   "player_color_bet"
    t.integer  "roulette_log_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "money",       default: 10000
    t.integer  "current_bet"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "roulette_logs", force: :cascade do |t|
    t.string   "roulette_round"
    t.string   "roulette_bet"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
