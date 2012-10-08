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

ActiveRecord::Schema.define(:version => 20121007155609) do

  create_table "assets", :force => true do |t|
    t.integer  "post_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "assets", ["post_id"], :name => "index_assets_on_post_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.string   "username"
    t.integer  "userId"
    t.string   "comment"
    t.date     "postDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_emails", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compensations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detailinfos", :force => true do |t|
    t.integer  "post_id"
    t.string   "accountnumber"
    t.string   "referencenumber"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_stats", :force => true do |t|
    t.integer  "postId"
    t.integer  "counter"
    t.datetime "lastsent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string "address"
    t.string "category"
    t.string "name"
    t.string "postcode"
    t.string "tel"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "posttype"
    t.string   "status"
    t.string   "category"
    t.string   "question"
    t.string   "description"
    t.string   "company"
    t.string   "address"
    t.string   "scenario"
    t.string   "compensation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scenarios", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "umvoxqs", :force => true do |t|
    t.integer  "user_id"
    t.string   "question"
    t.string   "description"
    t.string   "company"
    t.string   "address"
    t.string   "scenario"
    t.string   "compensation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "category"
  end

  create_table "umvoxs", :force => true do |t|
    t.integer  "user_id"
    t.string   "question"
    t.string   "description"
    t.string   "company"
    t.string   "address"
    t.string   "scenario"
    t.string   "compensation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "emaild"
    t.string   "city"
    t.string   "country"
    t.string   "state"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "fb_id"
    t.string   "fbid"
  end

end
