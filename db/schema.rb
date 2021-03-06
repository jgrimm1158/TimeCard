# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101114060732) do

  create_table "cards", :force => true do |t|
    t.boolean  "isSubmitted",   :default => false
    t.boolean  "isApproved",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "week_starting"
    t.boolean  "isExempt",      :default => false
    t.integer  "user_id"
  end

  create_table "days", :force => true do |t|
    t.date     "date"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "card_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exempt_days", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "worked"
  end

  create_table "hourly_days", :force => true do |t|
    t.integer  "hours_worked", :default => 0
    t.integer  "hours_PTO",    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",               :default => "",    :null => false
    t.string   "crypted_password",    :default => "",    :null => false
    t.string   "password_salt",       :default => "",    :null => false
    t.string   "persistence_token",   :default => "",    :null => false
    t.string   "single_access_token", :default => "",    :null => false
    t.string   "perishable_token",    :default => "",    :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "exempt",              :default => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "login"
    t.integer  "manager_id"
    t.boolean  "isManager",           :default => false
    t.integer  "department_id"
  end

end
