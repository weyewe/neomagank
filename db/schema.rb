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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111021041044) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "educations", :force => true do |t|
    t.string   "institution_name"
    t.date     "starting_date"
    t.date     "ending_date"
    t.text     "description"
    t.string   "degree"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portfolio_images", :force => true do |t|
    t.integer  "portfolio_id"
    t.string   "image_type"
    t.text     "image_url"
    t.boolean  "is_first",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portfolios", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.text     "teaser"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "portfolios", ["slug"], :name => "index_portfolios_on_slug", :unique => true

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "profile_pic"
    t.string   "cropped_profile_pic"
    t.string   "specialized_in"
    t.string   "race"
    t.string   "skin_color"
    t.string   "phone_number"
    t.text     "description"
    t.date     "birthdate"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.boolean  "is_cropping",         :default => false
  end

  add_index "profiles", ["slug"], :name => "index_profiles_on_slug", :unique => true

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "proficiency"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "work_experiences", :force => true do |t|
    t.string   "company_name"
    t.string   "position"
    t.string   "type_of_employment"
    t.text     "description"
    t.date     "starting_date"
    t.date     "ending_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
