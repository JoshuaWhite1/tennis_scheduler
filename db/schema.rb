# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_10_211856) do
  create_table "games", force: :cascade do |t|
    t.integer "match_schedule_id", null: false
    t.integer "player_1_id", null: false
    t.integer "player_2_id", null: false
    t.integer "player_3_id", null: false
    t.integer "player_4_id", null: false
    t.integer "game_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_schedule_id"], name: "index_games_on_match_schedule_id"
    t.index ["player_1_id"], name: "index_games_on_player_1_id"
    t.index ["player_2_id"], name: "index_games_on_player_2_id"
    t.index ["player_3_id"], name: "index_games_on_player_3_id"
    t.index ["player_4_id"], name: "index_games_on_player_4_id"
  end

  create_table "match_schedules", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "skill_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "match_schedules"
  add_foreign_key "games", "players", column: "player_1_id"
  add_foreign_key "games", "players", column: "player_2_id"
  add_foreign_key "games", "players", column: "player_3_id"
  add_foreign_key "games", "players", column: "player_4_id"
end
