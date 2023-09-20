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

ActiveRecord::Schema.define(version: 2023_09_20_065917) do

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ins", force: :cascade do |t|
    t.integer "kind"
    t.date "date"
    t.string "number"
    t.integer "document"
    t.float "quantity"
    t.float "price_unit"
    t.float "price_total"
    t.text "notes"
    t.integer "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_ins_on_stock_id"
  end

  create_table "requisitions", force: :cascade do |t|
    t.integer "kind"
    t.date "date"
    t.string "number"
    t.integer "department"
    t.decimal "quantity"
    t.decimal "average_cost"
    t.decimal "total_cost"
    t.text "notes"
    t.integer "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_requisitions_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "kind"
    t.string "description"
    t.string "code"
    t.string "string"
    t.string "unit"
    t.string "penshable"
    t.string "boolean"
    t.float "minimum_stock"
    t.float "maximum_stock"
    t.float "reorder_point"
    t.float "stock_balance"
    t.float "average_cost"
    t.float "total_cost"
    t.string "account"
    t.string "location"
    t.integer "status"
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_stocks_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "profile"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "ins", "stocks"
  add_foreign_key "requisitions", "stocks"
  add_foreign_key "stocks", "groups"
end
