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

ActiveRecord::Schema.define(version: 20150107161138) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "ad_customers", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "credit_card"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_locations", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.boolean  "ordered"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_orders", force: true do |t|
    t.integer  "ad_customer_id"
    t.integer  "ad_location_id"
    t.datetime "started_date"
    t.datetime "expired_date"
    t.float    "cost",           limit: 24
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_price_lists", force: true do |t|
    t.float    "price",          limit: 24
    t.string   "duration"
    t.integer  "ad_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "dob"
    t.string   "gender"
    t.string   "address"
    t.string   "phone"
    t.string   "profile_image"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.text     "content"
    t.integer  "admin_user_id", null: false
    t.string   "image"
    t.integer  "status_id",     null: false
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles_categories", id: false, force: true do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  create_table "blogger_levels", force: true do |t|
    t.string   "name"
    t.string   "avatar"
    t.integer  "views"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bloggers", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "dob"
    t.string   "phone"
    t.string   "address"
    t.string   "gender"
    t.string   "profile_image"
    t.string   "password"
    t.integer  "blogger_level_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bloggers", ["email"], name: "index_bloggers_on_email", unique: true, using: :btree
  add_index "bloggers", ["reset_password_token"], name: "index_bloggers_on_reset_password_token", unique: true, using: :btree

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.text     "content"
    t.string   "image"
    t.integer  "blogger_id"
    t.string   "status"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "article_id"
    t.integer  "blog_id"
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: true do |t|
    t.string   "object_type"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions_roles", id: false, force: true do |t|
    t.integer "permission_id"
    t.integer "role_id"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.string   "image"
    t.string   "video"
    t.string   "author"
    t.integer  "status_id"
    t.integer  "admin_user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "views_statistics", force: true do |t|
    t.integer  "views"
    t.integer  "article_id"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
