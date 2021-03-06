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

ActiveRecord::Schema.define(:version => 20121115005325) do

  create_table "hacks", :force => true do |t|
    t.string   "title"
    t.text     "hackers"
    t.boolean  "gen"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "active_hack"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "vote_logs", :force => true do |t|
    t.integer  "hack_id"
    t.float    "hack_score"
    t.datetime "logged_at"
    t.integer  "time_index"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "voters", :force => true do |t|
    t.string   "name"
    t.string   "department"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  create_table "votes", :force => true do |t|
    t.integer  "voter_id"
    t.integer  "hack_id"
    t.integer  "type"
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "direction"
    t.string   "department"
    t.boolean  "gen"
  end

end
