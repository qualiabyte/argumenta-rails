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

ActiveRecord::Schema.define(version: 20140108080121) do

  create_table "arguments", force: true do |t|
    t.string   "title"
    t.string   "sha1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "arguments_propositions", id: false, force: true do |t|
    t.string  "argument_sha1"
    t.string  "proposition_sha1"
    t.integer "position"
  end

  add_index "arguments_propositions", ["argument_sha1", "proposition_sha1"], name: "index_arguments_propositions_unique", unique: true
  add_index "arguments_propositions", ["argument_sha1"], name: "index_arguments_propositions_on_argument_sha1"
  add_index "arguments_propositions", ["proposition_sha1"], name: "index_arguments_propositions_on_proposition_sha1"

  create_table "propositions", force: true do |t|
    t.string   "text",       limit: 240, null: false
    t.string   "sha1",       limit: 40,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
