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

ActiveRecord::Schema.define(:version => 20130607020717) do

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["shop_id"], :name => "index_messages_on_shop_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "shops", :force => true do |t|
    t.string   "login_id"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "vip_requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.integer  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vip_requests", ["shop_id"], :name => "index_vip_requests_on_shop_id"
  add_index "vip_requests", ["user_id"], :name => "index_vip_requests_on_user_id"

  create_table "vips", :force => true do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.string   "property"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vips", ["shop_id"], :name => "index_vips_on_shop_id"
  add_index "vips", ["user_id"], :name => "index_vips_on_user_id"

end
