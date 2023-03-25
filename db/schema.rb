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

ActiveRecord::Schema[7.0].define(version: 2023_03_25_204031) do
  create_table "projects", force: :cascade do |t|
    t.string "team_id"
    t.string "app_name"
    t.string "team_name"
    t.string "pitch_video"
    t.string "demo_video"
    t.string "business_plan"
    t.string "journey"
    t.integer "member_num"
    t.string "year"
    t.string "prize"
    t.integer "semifinal"
    t.integer "final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "name"
  end

end
