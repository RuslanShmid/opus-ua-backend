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

ActiveRecord::Schema.define(version: 20170629105305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "users_vacancies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vacancy_id",                    null: false
    t.boolean  "creator",       default: false, null: false
    t.string   "email",                         null: false
    t.string   "full_name",                     null: false
    t.string   "description",                   null: false
    t.string   "filename",                      null: false
    t.string   "content_type",                  null: false
    t.binary   "file_contents",                 null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "title",                       null: false
    t.string   "category",                    null: false
    t.string   "email",                       null: false
    t.string   "city"
    t.datetime "active_to_date",              null: false
    t.string   "job_type"
    t.string   "description",                 null: false
    t.string   "company",                     null: false
    t.text     "tags",           default: [],              array: true
    t.float    "price_per_hour",              null: false
    t.string   "website"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
