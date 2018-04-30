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

ActiveRecord::Schema.define(version: 20180425224009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: :cascade do |t|
    t.string   "primary"
    t.string   "secondary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "computers", force: :cascade do |t|
    t.string   "serial"
    t.date     "rec_date"
    t.integer  "school_id"
    t.integer  "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "sold"
    t.integer  "skulist_id"
    t.integer  "store_id"
  end

  add_index "computers", ["sale_id"], name: "index_computers_on_sale_id", using: :btree
  add_index "computers", ["school_id"], name: "index_computers_on_school_id", using: :btree
  add_index "computers", ["skulist_id"], name: "index_computers_on_skulist_id", using: :btree
  add_index "computers", ["store_id"], name: "index_computers_on_store_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "customers", ["school_id"], name: "index_customers_on_school_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["store_id"], name: "index_locations_on_store_id", using: :btree
  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "title"
    t.string   "costs"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "monthly_return"
    t.integer  "school_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "plans", ["school_id"], name: "index_plans_on_school_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.date     "transaction_date"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "store_id"
  end

  add_index "sales", ["customer_id"], name: "index_sales_on_customer_id", using: :btree
  add_index "sales", ["store_id"], name: "index_sales_on_store_id", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "mascot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "color_id"
  end

  add_index "schools", ["color_id"], name: "index_schools_on_color_id", using: :btree

  create_table "skulists", force: :cascade do |t|
    t.string   "sku"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "model_number"
  end

  create_table "stores", force: :cascade do |t|
    t.integer  "school_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "store_number"
  end

  add_index "stores", ["school_id"], name: "index_stores_on_school_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "leader_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "teams", ["leader_id"], name: "index_teams_on_leader_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_level"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "employee_number"
  end

  add_foreign_key "computers", "sales"
  add_foreign_key "computers", "skulists"
  add_foreign_key "computers", "stores"
  add_foreign_key "customers", "schools"
  add_foreign_key "locations", "stores"
  add_foreign_key "locations", "users"
  add_foreign_key "plans", "schools"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "stores"
  add_foreign_key "sales", "users"
  add_foreign_key "schools", "colors"
  add_foreign_key "stores", "schools"
  add_foreign_key "teams", "users", column: "leader_id"
end
