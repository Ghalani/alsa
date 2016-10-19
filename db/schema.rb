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

ActiveRecord::Schema.define(version: 20161019092518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories_farmers", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "farmer_id"
  end

  create_table "certifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "iso"
    t.string   "name"
    t.string   "nicename"
    t.string   "iso3"
    t.string   "numcode"
    t.string   "phonecode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.integer  "lat"
    t.integer  "lon"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "farmer_certifications", force: :cascade do |t|
    t.integer  "farmer_id"
    t.integer  "certification_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "farmer_id_cards", force: :cascade do |t|
    t.integer  "farmer_id"
    t.integer  "id_card_id"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "farmers", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "phone"
    t.integer  "gender"
    t.date     "dob"
    t.integer  "educational_level"
    t.integer  "village_id"
    t.boolean  "caa_id"
    t.string   "kcl_district_id"
    t.boolean  "certified"
    t.integer  "marital_status"
    t.integer  "num_of_sharecroppers"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "organization_id"
  end

  add_index "farmers", ["organization_id"], name: "index_farmers_on_organization_id", using: :btree

  create_table "id_cards", force: :cascade do |t|
    t.string   "type"
    t.integer  "length"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
  end

  add_index "organizations", ["country_id"], name: "index_organizations_on_country_id", using: :btree
  add_index "organizations", ["user_id"], name: "index_organizations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "username"
    t.string   "fname"
    t.string   "lname"
    t.string   "phone"
    t.integer  "role"
    t.string   "salt"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "villages", force: :cascade do |t|
    t.integer  "district_id"
    t.string   "name"
    t.integer  "lat"
    t.integer  "lon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
