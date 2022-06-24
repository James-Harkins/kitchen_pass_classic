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

ActiveRecord::Schema.define(version: 2022_06_24_175829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_courses_on_location_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "realty_link"
    t.integer "guest_capacity"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_houses_on_trip_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nights", force: :cascade do |t|
    t.datetime "date"
    t.string "cost_per_person"
    t.string "float"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_nights_on_trip_id"
  end

  create_table "trip_courses", force: :cascade do |t|
    t.float "total_cost"
    t.float "cost_per_person"
    t.bigint "trip_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_trip_courses_on_course_id"
    t.index ["trip_id"], name: "index_trip_courses_on_trip_id"
  end

  create_table "trip_meals", force: :cascade do |t|
    t.datetime "date"
    t.float "cost_per_person"
    t.bigint "trip_id"
    t.bigint "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_trip_meals_on_meal_id"
    t.index ["trip_id"], name: "index_trip_meals_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "year"
    t.float "total_cost"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_trips_on_location_id"
  end

  create_table "user_nights", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "night_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["night_id"], name: "index_user_nights_on_night_id"
    t.index ["user_id"], name: "index_user_nights_on_user_id"
  end

  create_table "user_trip_courses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trip_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_course_id"], name: "index_user_trip_courses_on_trip_course_id"
    t.index ["user_id"], name: "index_user_trip_courses_on_user_id"
  end

  create_table "user_trip_meals", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trip_meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_meal_id"], name: "index_user_trip_meals_on_trip_meal_id"
    t.index ["user_id"], name: "index_user_trip_meals_on_user_id"
  end

  create_table "user_trips", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_user_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "courses", "locations"
  add_foreign_key "houses", "trips"
  add_foreign_key "nights", "trips"
  add_foreign_key "trip_courses", "courses"
  add_foreign_key "trip_courses", "trips"
  add_foreign_key "trip_meals", "meals"
  add_foreign_key "trip_meals", "trips"
  add_foreign_key "trips", "locations"
  add_foreign_key "user_nights", "nights"
  add_foreign_key "user_nights", "users"
  add_foreign_key "user_trip_courses", "trip_courses"
  add_foreign_key "user_trip_courses", "users"
  add_foreign_key "user_trip_meals", "trip_meals"
  add_foreign_key "user_trip_meals", "users"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "users"
end
