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

ActiveRecord::Schema.define(:version => 20130219022508) do

  create_table "author_statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "author_id"
  end

  create_table "authors", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "summary"
    t.string   "location"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "authors", ["email"], :name => "index_authors_on_email", :unique => true
  add_index "authors", ["remember_token"], :name => "index_authors_on_remember_token"

  create_table "chapters", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.string   "notes"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chapters_characters", :id => false, :force => true do |t|
    t.integer "chapter_id"
    t.integer "character_id"
  end

  create_table "chapters_locations", :id => false, :force => true do |t|
    t.integer "chapter_id"
    t.integer "location_id"
  end

  create_table "chapters_pictures", :id => false, :force => true do |t|
    t.integer "chapter_id"
    t.integer "picture_id"
  end

  create_table "character_summaries", :force => true do |t|
    t.string   "heading"
    t.string   "body"
    t.integer  "character_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "elevator"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "characters_locations", :id => false, :force => true do |t|
    t.integer "character_id"
    t.integer "location_id"
  end

  create_table "characters_pictures", :id => false, :force => true do |t|
    t.integer "character_id"
    t.integer "picture_id"
  end

  create_table "location_summaries", :force => true do |t|
    t.string   "heading"
    t.string   "body"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "elevator"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations_pictures", :id => false, :force => true do |t|
    t.integer "location_id"
    t.integer "picture_id"
  end

  create_table "outlines", :force => true do |t|
    t.string   "title"
    t.integer  "order"
    t.string   "description"
    t.string   "notes"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_statuses", :force => true do |t|
    t.string   "status"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_updates", :force => true do |t|
    t.string   "update"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "elevator"
    t.string   "skeleton"
    t.string   "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects_authors", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "author_id"
  end

end
