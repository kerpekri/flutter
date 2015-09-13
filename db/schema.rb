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

ActiveRecord::Schema.define(version: 20150913205543) do

  create_table "nodes", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "locale",        limit: 6
    t.string   "content_type"
    t.integer  "content_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "item_position"
    t.boolean  "active",                  default: true, null: false
  end

  add_index "nodes", ["active"], name: "index_nodes_on_active"
  add_index "nodes", ["content_type", "content_id"], name: "index_nodes_on_content_type_and_content_id"
  add_index "nodes", ["depth"], name: "index_nodes_on_depth"
  add_index "nodes", ["lft"], name: "index_nodes_on_lft"
  add_index "nodes", ["locale"], name: "index_nodes_on_locale"
  add_index "nodes", ["name"], name: "index_nodes_on_name"
  add_index "nodes", ["parent_id"], name: "index_nodes_on_parent_id"
  add_index "nodes", ["rgt"], name: "index_nodes_on_rgt"
  add_index "nodes", ["slug"], name: "index_nodes_on_slug"

  create_table "releaf_permissions", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "permission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "releaf_permissions", ["owner_id", "owner_type"], name: "index_releaf_permissions_on_owner_id_and_owner_type"
  add_index "releaf_permissions", ["permission"], name: "index_releaf_permissions_on_permission"

  create_table "releaf_richtext_attachments", force: :cascade do |t|
    t.string   "file_uid"
    t.string   "file_name"
    t.string   "file_type"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "releaf_roles", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "default_controller"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "releaf_translation_data", force: :cascade do |t|
    t.integer  "translation_id",           null: false
    t.string   "lang",           limit: 5, null: false
    t.text     "localization"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "releaf_translation_data", ["lang", "translation_id"], name: "index_releaf_translation_data_on_lang_and_translation_id", unique: true
  add_index "releaf_translation_data", ["lang"], name: "index_releaf_translation_data_on_lang"
  add_index "releaf_translation_data", ["translation_id"], name: "index_releaf_translation_data_on_translation_id"

  create_table "releaf_translations", force: :cascade do |t|
    t.string   "key",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "releaf_translations", ["key"], name: "index_releaf_translations_on_key", unique: true

  create_table "releaf_users", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "surname",                             null: false
    t.string   "locale"
    t.integer  "role_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "releaf_users", ["email"], name: "index_releaf_users_on_email", unique: true
  add_index "releaf_users", ["reset_password_token"], name: "index_releaf_users_on_reset_password_token", unique: true
  add_index "releaf_users", ["role_id"], name: "index_releaf_users_on_role_id"

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
