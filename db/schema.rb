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

ActiveRecord::Schema.define(version: 2019_01_27_181618) do

  create_table "airplanes", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "airplane_type"
  end

  create_table "airports", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "airplane_id", null: false
    t.string "flight_number"
    t.string "origin_id"
    t.string "destination_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airplane_id"], name: "index_flights_on_airplane_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
  end

  create_table "seat_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
  end

  create_table "seat_configurations", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "airplane_id", null: false
    t.bigint "seat_category_id", null: false
    t.integer "number_of_rows"
    t.integer "seats_in_row"
    t.decimal "base_amount", precision: 9, scale: 2, unsigned: true
    t.index ["airplane_id"], name: "index_seat_configurations_on_airplane_id"
    t.index ["seat_category_id"], name: "index_seat_configurations_on_seat_category_id"
  end

  create_table "seats", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "seat_configuration_id"
    t.string "pnr_number"
    t.boolean "booked", default: false
    t.index ["pnr_number"], name: "index_seats_on_pnr_number"
    t.index ["seat_configuration_id"], name: "index_seats_on_seat_configuration_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id", default: 2
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "flights", "airplanes"
  add_foreign_key "seat_configurations", "airplanes"
  add_foreign_key "seat_configurations", "seat_categories"
  add_foreign_key "seats", "seat_configurations"
end
