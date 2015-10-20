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

ActiveRecord::Schema.define(version: 20151020073548) do

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",         limit: 255
    t.string   "middle_name",        limit: 255
    t.string   "last_name",          limit: 255
    t.string   "department",         limit: 255
    t.boolean  "admin",                          default: false
    t.boolean  "active",                         default: false
    t.string   "email",              limit: 255, default: "",    null: false
    t.string   "encrypted_password", limit: 255, default: "",    null: false
    t.integer  "sign_in_count",      limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 255
    t.string   "last_sign_in_ip",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transaction_admin",              default: false
  end

  add_index "employees", ["email"], name: "index_employees_on_email", unique: true, using: :btree

  create_table "form_histories", force: :cascade do |t|
    t.integer  "tracking_form_id", limit: 4
    t.string   "description",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_histories", ["tracking_form_id"], name: "index_form_histories_on_tracking_form_id", using: :btree

  create_table "form_remarks", force: :cascade do |t|
    t.integer  "tracking_form_id", limit: 4
    t.text     "content",          limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_remarks", ["tracking_form_id"], name: "index_form_remarks_on_tracking_form_id", using: :btree

  create_table "tracking_forms", force: :cascade do |t|
    t.string   "uid",                 limit: 99
    t.string   "prepared_by",         limit: 99,    default: ""
    t.string   "department",          limit: 55,    default: ""
    t.string   "transaction_type",    limit: 99,    default: ""
    t.date     "date_filed"
    t.string   "origination_dept",    limit: 55,    default: ""
    t.string   "current_dept",        limit: 55
    t.float    "amount",              limit: 24,    default: 0.0
    t.boolean  "recently_created",                  default: false
    t.boolean  "forwarded",                         default: false
    t.boolean  "returned",                          default: false
    t.boolean  "complete_docs",                     default: false
    t.text     "transaction_name",    limit: 65535
    t.text     "pending_information", limit: 65535
    t.text     "return_notice",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "received",                          default: false
    t.string   "receiver",            limit: 255,   default: ""
    t.boolean  "pending",                           default: false
    t.string   "prev_dept",           limit: 255,   default: ""
    t.boolean  "finished",                          default: false
  end

end
