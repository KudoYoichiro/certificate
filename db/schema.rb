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

ActiveRecord::Schema.define(version: 20140813065859) do

  create_table "engineers", force: true do |t|
    t.string   "name"
    t.integer  "service_center_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "engineers", ["service_center_id"], name: "index_engineers_on_service_center_id", using: :btree

  create_table "instruments", force: true do |t|
    t.string   "name"
    t.integer  "maker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instruments", ["maker_id"], name: "index_instruments_on_maker_id", using: :btree

  create_table "makers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", force: true do |t|
    t.integer  "engineer_id"
    t.integer  "instrument_id"
    t.integer  "operation_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "maps", ["engineer_id"], name: "index_maps_on_engineer_id", using: :btree
  add_index "maps", ["instrument_id"], name: "index_maps_on_instrument_id", using: :btree
  add_index "maps", ["operation_id"], name: "index_maps_on_operation_id", using: :btree
  add_index "maps", ["status_id"], name: "index_maps_on_status_id", using: :btree

  create_table "operations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_centers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
