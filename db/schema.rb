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

ActiveRecord::Schema.define(version: 2022_06_25_141448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "leave_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "line_manager_id"
    t.date "application_date"
    t.datetime "leave_start_date"
    t.datetime "leave_end_date"
    t.string "leave_type"
    t.string "pre_approve", default: "pending"
    t.string "approve"
    t.string "reason"
    t.string "certificate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "hr_officer_id"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "hourly_leave"
    t.index ["user_id"], name: "index_leaves_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "super_user_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["super_user_id"], name: "index_roles_on_super_user_id"
  end

  create_table "super_users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "nmae"
    t.string "adress"
    t.date "date_of_berth"
    t.date "start_date"
    t.date "end_of_contarct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attendances", "users"
  add_foreign_key "leave_requests", "users"
  add_foreign_key "leave_requests", "users", column: "hr_officer_id"
  add_foreign_key "leave_requests", "users", column: "line_manager_id"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "permissions", "roles"
  add_foreign_key "posts", "users"
  add_foreign_key "user_profiles", "users"
end
