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

ActiveRecord::Schema.define(:version => 20120611125810) do

  create_table "addresses", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "state"
    t.string   "state_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "faculty_id"
  end

  create_table "addresses_guardians", :force => true do |t|
    t.integer "address_id"
    t.integer "guardian_id"
  end

  create_table "addresses_students", :force => true do |t|
    t.integer "student_id"
    t.integer "address_id"
  end

  create_table "class_group_enrollments", :force => true do |t|
    t.integer  "class_group_id"
    t.integer  "student_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "class_group_enrollments", ["class_group_id"], :name => "index_class_group_enrollments_on_class_group_id"
  add_index "class_group_enrollments", ["student_id"], :name => "index_class_group_enrollments_on_student_id"

  create_table "class_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "faculty_id"
  end

  create_table "contact_types", :force => true do |t|
    t.string "name"
  end

  create_table "contacts", :force => true do |t|
    t.string   "data"
    t.text     "details"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "contact_type_id"
    t.integer  "student_id"
    t.integer  "guardian_id"
    t.integer  "faculty_id"
  end

  create_table "countries", :force => true do |t|
    t.string  "iso_name"
    t.string  "iso"
    t.string  "iso3"
    t.string  "name"
    t.integer "numcode"
  end

  create_table "course_enrollments", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "course_enrollments", ["course_id"], :name => "index_course_enrollments_on_course_id"
  add_index "course_enrollments", ["student_id"], :name => "index_course_enrollments_on_student_id"

  create_table "courses", :force => true do |t|
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "faculty_id"
  end

  create_table "exam_portion_scores", :force => true do |t|
    t.float    "score"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "exam_portion_id"
  end

  create_table "exam_portions", :force => true do |t|
    t.string   "name"
    t.float    "max_score"
    t.float    "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "exam_id"
  end

  create_table "exam_scores", :force => true do |t|
    t.float    "score"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "exam_id"
    t.integer  "student_id"
  end

  create_table "exams", :force => true do |t|
    t.string   "name"
    t.integer  "problem_count"
    t.float    "max_score"
    t.float    "weight"
    t.binary   "data"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "schedule_id"
  end

  create_table "faculties", :force => true do |t|
    t.integer "profile_id"
    t.integer "users_id"
  end

  create_table "guardians", :force => true do |t|
    t.string  "relationship"
    t.integer "profile_id"
    t.integer "user_id"
  end

  create_table "installs", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "installs", ["email"], :name => "index_installs_on_email", :unique => true
  add_index "installs", ["reset_password_token"], :name => "index_installs_on_reset_password_token", :unique => true

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "student_id"
  end

  create_table "profiles", :force => true do |t|
    t.string   "surname"
    t.string   "name"
    t.string   "name_reading"
    t.string   "email"
    t.datetime "birth_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "roles", :force => true do |t|
    t.integer "faculty_id"
    t.string  "name"
  end

  create_table "schedules", :force => true do |t|
    t.datetime "start"
    t.datetime "stop"
    t.string   "repeat"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string  "name"
    t.string  "abbr"
    t.integer "country_id"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.date     "birth"
    t.date     "admitted"
    t.date     "graduated"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "profile_id"
    t.integer  "faculty_id"
  end

  create_table "syllabuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "credits"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "code"
  end

  create_table "users", :force => true do |t|
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
