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

ActiveRecord::Schema.define(version: 20160307060607) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "content"
    t.string   "img_url",     default: ""
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.text     "subcontent", default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "submission_answers", force: :cascade do |t|
    t.integer  "submission_id"
    t.integer  "answer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "submission_answers", ["answer_id"], name: "index_submission_answers_on_answer_id"
  add_index "submission_answers", ["submission_id"], name: "index_submission_answers_on_submission_id"

  create_table "submissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "ip"
  end

end
