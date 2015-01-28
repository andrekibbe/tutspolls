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

ActiveRecord::Schema.define(version: 20150128170620) do

  create_table "answers", force: :cascade do |t|
    t.integer  "reply_id"
    t.integer  "question_id"
    t.integer  "possible_answer_id"
    t.string   "value"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "answers", ["possible_answer_id"], name: "index_answers_on_possible_answer_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["reply_id"], name: "index_answers_on_reply_id"

  create_table "polls", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "possible_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "possible_answers", ["question_id"], name: "index_possible_answers_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.string   "kind"
    t.integer  "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["poll_id"], name: "index_questions_on_poll_id"

  create_table "replies", force: :cascade do |t|
    t.integer  "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "replies", ["poll_id"], name: "index_replies_on_poll_id"

end
