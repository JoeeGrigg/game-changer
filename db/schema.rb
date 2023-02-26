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

ActiveRecord::Schema[7.0].define(version: 2023_02_26_080006) do
  create_table "challenges", force: :cascade do |t|
    t.integer "game_id", null: false
    t.string "value", null: false
    t.integer "difficulty", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_challenges_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "session_game_challenges", force: :cascade do |t|
    t.integer "session_id", null: false
    t.integer "game_id", null: false
    t.integer "challenge_id", null: false
    t.boolean "done", default: false, null: false
    t.integer "round", null: false
    t.integer "player_id", null: false
    t.integer "judge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_session_game_challenges_on_challenge_id"
    t.index ["game_id"], name: "index_session_game_challenges_on_game_id"
    t.index ["session_id"], name: "index_session_game_challenges_on_session_id"
  end

  create_table "session_players", force: :cascade do |t|
    t.integer "session_id", null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_session_players_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "code", null: false
    t.integer "status"
    t.string "name"
    t.integer "number_of_games", default: 1, null: false
    t.integer "rounds", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
