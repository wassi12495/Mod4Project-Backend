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

ActiveRecord::Schema.define(version: 20180124153949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_leagues", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_favorite_leagues_on_league_id"
    t.index ["user_id"], name: "index_favorite_leagues_on_user_id"
  end

  create_table "favorite_teams", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_favorite_teams_on_team_id"
    t.index ["user_id"], name: "index_favorite_teams_on_user_id"
  end

  create_table "fixtures", force: :cascade do |t|
    t.string "home"
    t.string "away"
    t.integer "home_score"
    t.integer "away_score"
    t.string "date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "league_fixtures", force: :cascade do |t|
    t.bigint "league_id"
    t.bigint "fixture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fixture_id"], name: "index_league_fixtures_on_fixture_id"
    t.index ["league_id"], name: "index_league_fixtures_on_league_id"
  end

  create_table "league_teams", force: :cascade do |t|
    t.bigint "league_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_teams_on_league_id"
    t.index ["team_id"], name: "index_league_teams_on_team_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.integer "api_id"
    t.string "league_abr"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_fixtures", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "fixture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fixture_id"], name: "index_team_fixtures_on_fixture_id"
    t.index ["team_id"], name: "index_team_fixtures_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "api_url"
    t.integer "position"
    t.string "img"
    t.integer "wins"
    t.integer "draws"
    t.integer "losses"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorite_leagues", "leagues"
  add_foreign_key "favorite_leagues", "users"
  add_foreign_key "favorite_teams", "teams"
  add_foreign_key "favorite_teams", "users"
  add_foreign_key "league_fixtures", "fixtures"
  add_foreign_key "league_fixtures", "leagues"
  add_foreign_key "league_teams", "leagues"
  add_foreign_key "league_teams", "teams"
  add_foreign_key "team_fixtures", "fixtures"
  add_foreign_key "team_fixtures", "teams"
end
