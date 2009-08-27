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

ActiveRecord::Schema.define(:version => 20090827005637) do

  create_table "field_groups", :force => true do |t|
    t.integer  "sort_order"
    t.string   "title"
    t.string   "preamble"
    t.integer  "survey_schema_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_groups_fields", :force => true do |t|
    t.string   "field_type"
    t.integer  "field_id"
    t.integer  "field_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_responses", :force => true do |t|
    t.string   "value"
    t.integer  "field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fields", :force => true do |t|
    t.integer  "sort_order"
    t.string   "prompt"
    t.integer  "type"
    t.integer  "survey_schema_id"
    t.integer  "field_group_id"
    t.integer  "subfield_id"
    t.integer  "superfield_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_responses", :force => true do |t|
    t.integer  "survey_schema_id"
    t.integer  "responder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_schemas", :force => true do |t|
    t.string   "title"
    t.string   "preamble"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
