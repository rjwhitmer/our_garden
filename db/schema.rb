# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_27_225902) do

  create_table "gardeners", force: :cascade do |t|
    t.text "name"
    t.integer "age"
    t.integer "years_experience"
  end

  create_table "gardens", force: :cascade do |t|
    t.integer "gardeners_id"
    t.integer "plants_id"
    t.text "name"
    t.index ["gardeners_id"], name: "index_gardens_on_gardeners_id"
    t.index ["plants_id"], name: "index_gardens_on_plants_id"
  end

  create_table "plants", force: :cascade do |t|
    t.text "name"
    t.integer "days_to_harvest"
  end

end
