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

ActiveRecord::Schema[8.1].define(version: 2026_08_26_043012) do
  create_table "habits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.boolean "steps_completed"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.boolean "water_completed"
    t.index ["user_id"], name: "index_habits_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.integer "calories"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "description"
    t.string "meal_type"
    t.integer "protein"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "energy_level"
    t.string "mood"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "daily_calorie_goal"
    t.integer "daily_protein_goal"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "habits", "users"
  add_foreign_key "meals", "users"
  add_foreign_key "notes", "users"
end
