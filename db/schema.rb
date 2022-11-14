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

ActiveRecord::Schema.define(version: 20221114171150) do

  create_table "division_teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "team_id",     null: false
    t.integer  "division_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["division_id"], name: "index_division_teams_on_division_id", using: :btree
    t.index ["team_id"], name: "index_division_teams_on_team_id", using: :btree
  end

  create_table "divisions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "tournament_id",           null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "category",      limit: 1, null: false
    t.index ["tournament_id"], name: "index_divisions_on_tournament_id", using: :btree
  end

  create_table "games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "tournament_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_games_on_tournament_id", using: :btree
  end

  create_table "team_games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "team_id",    null: false
    t.integer  "game_id",    null: false
    t.boolean  "win",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "win"], name: "index_team_games_on_game_id_and_win", unique: true, using: :btree
    t.index ["game_id"], name: "index_team_games_on_game_id", using: :btree
    t.index ["team_id"], name: "index_team_games_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teams_on_name", unique: true, using: :btree
  end

  create_table "tournament_teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "team_id",       null: false
    t.integer  "tournament_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["team_id", "tournament_id"], name: "index_tournament_teams_on_team_id_and_tournament_id", unique: true, using: :btree
    t.index ["team_id"], name: "index_tournament_teams_on_team_id", using: :btree
    t.index ["tournament_id"], name: "index_tournament_teams_on_tournament_id", using: :btree
  end

  create_table "tournaments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                    null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "status",     limit: 11, default: "draft"
    t.index ["name"], name: "index_tournaments_on_name", unique: true, using: :btree
  end

  add_foreign_key "division_teams", "divisions"
  add_foreign_key "division_teams", "teams"
  add_foreign_key "divisions", "tournaments"
  add_foreign_key "games", "tournaments"
  add_foreign_key "team_games", "games"
  add_foreign_key "team_games", "teams"
  add_foreign_key "tournament_teams", "teams"
  add_foreign_key "tournament_teams", "tournaments"
end
