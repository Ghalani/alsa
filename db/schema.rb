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

ActiveRecord::Schema.define(version: 20161212163421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.string   "iso_code"
    t.string   "iso_numeric"
    t.string   "symbol"
    t.string   "subunit"
    t.string   "seperator",   default: "."
    t.string   "delimeter",   default: ","
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "customer_orders", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "customer_id"
    t.integer  "status",          default: 0
    t.datetime "date_ordered",    default: '2016-11-23 11:24:25'
    t.integer  "deliverer_id"
    t.datetime "date_delivered"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "customer_orders", ["customer_id"], name: "index_customer_orders_on_customer_id", using: :btree
  add_index "customer_orders", ["organization_id"], name: "index_customer_orders_on_organization_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "customers", ["organization_id"], name: "index_customers_on_organization_id", using: :btree

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
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "farmers", ["organization_id"], name: "index_farmers_on_organization_id", using: :btree

  create_table "farms", force: :cascade do |t|
    t.integer  "farmer_id"
    t.integer  "organization_id"
    t.integer  "village_id"
    t.string   "name"
    t.decimal  "size"
    t.jsonb    "points",          default: [],              array: true
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "incoming_stocks", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "stock_item_id"
    t.integer  "stock_source_id"
    t.integer  "receiver_id"
    t.integer  "quantity"
    t.datetime "arrived_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "incoming_stocks", ["organization_id"], name: "index_incoming_stocks_on_organization_id", using: :btree
  add_index "incoming_stocks", ["stock_item_id"], name: "index_incoming_stocks_on_stock_item_id", using: :btree
  add_index "incoming_stocks", ["stock_source_id"], name: "index_incoming_stocks_on_stock_source_id", using: :btree

  create_table "job_form_reports", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "job_id"
    t.integer  "worker_id"
    t.integer  "task_form_id"
    t.jsonb    "report"
    t.datetime "datetime"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "job_form_reports", ["job_id"], name: "index_job_form_reports_on_job_id", using: :btree
  add_index "job_form_reports", ["organization_id"], name: "index_job_form_reports_on_organization_id", using: :btree
  add_index "job_form_reports", ["task_form_id"], name: "index_job_form_reports_on_task_form_id", using: :btree
  add_index "job_form_reports", ["worker_id"], name: "index_job_form_reports_on_worker_id", using: :btree

  create_table "job_ratings", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "job_id"
    t.integer  "worker_id"
    t.integer  "job_report_id"
    t.string   "remark"
    t.integer  "value"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "job_ratings", ["job_id"], name: "index_job_ratings_on_job_id", using: :btree
  add_index "job_ratings", ["job_report_id"], name: "index_job_ratings_on_job_report_id", using: :btree
  add_index "job_ratings", ["organization_id"], name: "index_job_ratings_on_organization_id", using: :btree
  add_index "job_ratings", ["worker_id"], name: "index_job_ratings_on_worker_id", using: :btree

  create_table "job_reports", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "job_id"
    t.integer  "worker_id"
    t.integer  "remark"
    t.datetime "datetime"
    t.integer  "status",          default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "job_reports", ["job_id"], name: "index_job_reports_on_job_id", using: :btree
  add_index "job_reports", ["organization_id"], name: "index_job_reports_on_organization_id", using: :btree
  add_index "job_reports", ["worker_id"], name: "index_job_reports_on_worker_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "task_id"
    t.integer  "location_id"
    t.integer  "worker_id"
    t.integer  "recepient",          default: 0
    t.integer  "recepient_id"
    t.integer  "frequency",          default: 0
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "status",             default: 0
    t.text     "description"
    t.integer  "cost_per_worker",    default: 0
    t.integer  "leader_cost",        default: 0
    t.integer  "max_worker",         default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "jobs", ["location_id"], name: "index_jobs_on_location_id", using: :btree
  add_index "jobs", ["organization_id"], name: "index_jobs_on_organization_id", using: :btree
  add_index "jobs", ["task_id"], name: "index_jobs_on_task_id", using: :btree
  add_index "jobs", ["worker_id"], name: "index_jobs_on_worker_id", using: :btree

  create_table "jobs_workers", id: false, force: :cascade do |t|
    t.integer "job_id"
    t.integer "worker_id"
  end

  add_index "jobs_workers", ["job_id"], name: "index_jobs_workers_on_job_id", using: :btree
  add_index "jobs_workers", ["worker_id"], name: "index_jobs_workers_on_worker_id", using: :btree

  create_table "labourers", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "village_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "phone"
    t.integer  "gender"
    t.date     "dob"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "labourers", ["organization_id"], name: "index_labourers_on_organization_id", using: :btree
  add_index "labourers", ["village_id"], name: "index_labourers_on_village_id", using: :btree

  create_table "location_types", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "location_type_id"
    t.jsonb    "points",           default: [],              array: true
    t.decimal  "lat"
    t.decimal  "lon"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "ordered_stocks", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "stock_item_id"
    t.integer  "customer_order_id"
    t.integer  "receiver_id"
    t.integer  "quantity"
    t.integer  "cost"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "ordered_stocks", ["customer_order_id"], name: "index_ordered_stocks_on_customer_order_id", using: :btree
  add_index "ordered_stocks", ["organization_id"], name: "index_ordered_stocks_on_organization_id", using: :btree
  add_index "ordered_stocks", ["stock_item_id"], name: "index_ordered_stocks_on_stock_item_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "country_id"
    t.integer  "currency_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "organizations", ["country_id"], name: "index_organizations_on_country_id", using: :btree
  add_index "organizations", ["user_id"], name: "index_organizations_on_user_id", using: :btree

  create_table "outgoing_stocks", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "stock_item_id"
    t.integer  "storage_id"
    t.integer  "ordered_stock_id"
    t.integer  "quantity"
    t.integer  "requester_id"
    t.integer  "releaser_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "stored_stock_id"
  end

  add_index "outgoing_stocks", ["organization_id"], name: "index_outgoing_stocks_on_organization_id", using: :btree
  add_index "outgoing_stocks", ["stock_item_id"], name: "index_outgoing_stocks_on_stock_item_id", using: :btree
  add_index "outgoing_stocks", ["stored_stock_id"], name: "index_outgoing_stocks_on_stored_stock_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.jsonb    "permissions"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "stock_items", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "stock_type_id"
    t.string   "name"
    t.integer  "cost"
    t.integer  "minimum_quantity"
    t.jsonb    "extra",              default: [],              array: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "stock_items", ["organization_id"], name: "index_stock_items_on_organization_id", using: :btree
  add_index "stock_items", ["stock_type_id"], name: "index_stock_items_on_stock_type_id", using: :btree

  create_table "stock_sources", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "stock_sources", ["organization_id"], name: "index_stock_sources_on_organization_id", using: :btree

  create_table "stock_types", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.string   "description"
    t.string   "unit"
    t.jsonb    "extra_fields",    default: [],              array: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "stock_types", ["organization_id"], name: "index_stock_types_on_organization_id", using: :btree

  create_table "storage_types", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "storage_types", ["organization_id"], name: "index_storage_types_on_organization_id", using: :btree

  create_table "storages", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "storage_type_id"
    t.string   "name"
    t.integer  "location_id"
    t.decimal  "lat"
    t.decimal  "lon"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "storages", ["location_id"], name: "index_storages_on_location_id", using: :btree
  add_index "storages", ["organization_id"], name: "index_storages_on_organization_id", using: :btree
  add_index "storages", ["storage_type_id"], name: "index_storages_on_storage_type_id", using: :btree

  create_table "stored_stocks", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "stock_item_id"
    t.integer  "storage_id"
    t.integer  "incoming_stock_id"
    t.integer  "quantity"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "quantity_taken",    default: 0
  end

  add_index "stored_stocks", ["organization_id"], name: "index_stored_stocks_on_organization_id", using: :btree
  add_index "stored_stocks", ["stock_item_id"], name: "index_stored_stocks_on_stock_item_id", using: :btree

  create_table "task_forms", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "task_id"
    t.string   "name"
    t.jsonb    "fields"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "task_forms", ["organization_id"], name: "index_task_forms_on_organization_id", using: :btree
  add_index "task_forms", ["task_id"], name: "index_task_forms_on_task_id", using: :btree

  create_table "task_types", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "task_types", ["organization_id"], name: "index_task_types_on_organization_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "task_type_id"
    t.string   "name"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "tasks", ["organization_id"], name: "index_tasks_on_organization_id", using: :btree
  add_index "tasks", ["task_type_id"], name: "index_tasks_on_task_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "username"
    t.string   "fname"
    t.string   "lname"
    t.string   "phone"
    t.string   "salt"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "activation_digest"
    t.boolean  "activated",              default: false
    t.datetime "activated_at"
    t.integer  "app_role",               default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "worker_types", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "parent_id"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "worker_types", ["organization_id"], name: "index_worker_types_on_organization_id", using: :btree

  create_table "workers", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "worker_type_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "phone"
    t.string   "salt"
    t.string   "encrypted_pin"
    t.string   "access_token"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "workers", ["organization_id"], name: "index_workers_on_organization_id", using: :btree

end
