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

ActiveRecord::Schema[7.0].define(version: 2023_03_09_210015) do
  create_table "codes", force: :cascade do |t|
    t.string "value"
    t.integer "scope", default: 0
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "\"value\", \"customer\"", name: "index_codes_on_value_and_customer", unique: true
    t.index ["customer_id"], name: "index_codes_on_customer_id"
  end

  create_table "containers", force: :cascade do |t|
    t.integer "room_id", null: false
    t.integer "customer_id", null: false
    t.integer "container_id"
    t.string "name", null: false
    t.string "description"
    t.string "photo"
    t.integer "code_id", null: false
    t.string "container_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_containers_on_code_id"
    t.index ["container_id"], name: "index_containers_on_container_id"
    t.index ["customer_id"], name: "index_containers_on_customer_id"
    t.index ["room_id"], name: "index_containers_on_room_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_customers_on_login", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.integer "container_id", null: false
    t.integer "customer_id", null: false
    t.integer "code_id", null: false
    t.string "name"
    t.string "description"
    t.string "picture"
    t.string "item_code"
    t.integer "quantity", default: 1, null: false
    t.boolean "is_sold", default: false
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_items_on_code_id"
    t.index ["container_id"], name: "index_items_on_container_id"
    t.index ["customer_id"], name: "index_items_on_customer_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_rooms_on_customer_id"
  end

  add_foreign_key "codes", "customers"
  add_foreign_key "containers", "codes"
  add_foreign_key "containers", "containers"
  add_foreign_key "containers", "customers"
  add_foreign_key "containers", "rooms"
  add_foreign_key "items", "codes"
  add_foreign_key "items", "containers"
  add_foreign_key "items", "customers"
  add_foreign_key "rooms", "customers"
end
