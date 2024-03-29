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

ActiveRecord::Schema[7.0].define(version: 2022_12_13_184406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.string "exception"
    t.time "clock_in"
    t.time "clock_out"
    t.time "break_in"
    t.time "break_out"
    t.time "break_duration"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "categories_roles", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_roles_on_category_id"
    t.index ["role_id"], name: "index_categories_roles_on_role_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leave_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "line_manager_id"
    t.date "application_date"
    t.datetime "leave_start_date", precision: nil
    t.datetime "leave_end_date", precision: nil
    t.string "leave_type"
    t.string "approve"
    t.string "reason"
    t.string "certificate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hr_officer_id"
    t.text "reject_reason"
    t.index ["hr_officer_id"], name: "index_leave_requests_on_hr_officer_id"
    t.index ["line_manager_id"], name: "index_leave_requests_on_line_manager_id"
    t.index ["user_id"], name: "index_leave_requests_on_user_id"
  end

  create_table "leaves", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "annual_leave"
    t.integer "sick_leave"
    t.integer "maternity_leave"
    t.integer "marriage_leave"
    t.integer "paternity_leave"
    t.integer "bereavement_leave"
    t.integer "compensatory_off_leave"
    t.integer "loss_of_pay_leave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hourly_leave"
    t.index ["user_id"], name: "index_leaves_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "location"
    t.bigint "city_id", null: false
    t.bigint "user_id"
    t.index ["city_id"], name: "index_offices_on_city_id"
    t.index ["user_id"], name: "index_offices_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id", default: 0
    t.text "city_id", default: [], array: true
    t.text "office_id", default: [], array: true
  end

  create_table "super_users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id", default: 0
    t.index ["role_id"], name: "index_super_users_on_role_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "nmae"
    t.string "adress"
    t.date "date_of_berth"
    t.date "start_date"
    t.date "end_of_contarct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "monthly_salary"
    t.string "educational_degree"
    t.string "position"
    t.string "working_city"
    t.string "working_country"
    t.string "working_office"
    t.string "line_manager"
    t.string "gender"
    t.index ["user_id"], name: "index_user_profiles_on_user_id", unique: true
  end

  create_table "user_workflows", force: :cascade do |t|
    t.string "workflow_name"
    t.string "workflow_manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "office_id"
    t.index ["office_id"], name: "index_user_workflows_on_office_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_workflow_id", default: 0, null: false
    t.bigint "line_manager_id", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["line_manager_id"], name: "index_users_on_line_manager_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_workflow_id"], name: "index_users_on_user_workflow_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attendances", "users"
  add_foreign_key "categories_roles", "categories"
  add_foreign_key "categories_roles", "roles"
  add_foreign_key "leave_requests", "users"
  add_foreign_key "leave_requests", "users", column: "hr_officer_id"
  add_foreign_key "leave_requests", "users", column: "line_manager_id"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "user_profiles", "users"
end
