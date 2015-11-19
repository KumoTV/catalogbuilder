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

ActiveRecord::Schema.define(version: 201511182339999) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "encoding_profiles", force: :cascade do |t|
    t.string   "preset_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "encoding_profiles", ["name"], name: "index_encoding_profiles_on_name", unique: true, using: :btree
  add_index "encoding_profiles", ["preset_id"], name: "index_encoding_profiles_on_preset_id", unique: true, using: :btree

  create_table "media_items", force: :cascade do |t|
    t.string   "media_item_id"
    t.string   "s3_input_key"
    t.string   "s3_output_key"
    t.string   "cloudfront_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "media_items", ["cloudfront_url"], name: "index_media_items_on_cloudfront_url", unique: true, using: :btree

end
