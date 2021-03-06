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

ActiveRecord::Schema.define(:version => 20110919224959) do

  create_table "meritbadges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "removed_date"
    t.string   "image_url"
    t.text     "requirements_text"
    t.string   "requirements_path"
    t.integer  "required"
  end

  create_table "requirements", :force => true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meritbadge_id"
    t.string   "designation"
  end

  create_table "scout_masters", :force => true do |t|
    t.string   "name"
    t.integer  "troop_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scout_masters_scouters", :id => false, :force => true do |t|
    t.integer "scout_master_id"
    t.integer "scouter_id"
  end

  create_table "scouter_meritbadges", :force => true do |t|
    t.integer  "scouter_id"
    t.integer  "meritbadge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "requirements"
    t.date     "completed_date"
  end

  create_table "scouters", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.float    "age"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "troop_number"
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "scouters", ["email"], :name => "index_scouters_on_email", :unique => true
  add_index "scouters", ["reset_password_token"], :name => "index_scouters_on_reset_password_token", :unique => true

end
