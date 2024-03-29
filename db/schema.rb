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

ActiveRecord::Schema.define(:version => 20130419122027) do

  create_table "choices", :force => true do |t|
    t.string   "name"
    t.integer  "decision_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "choices", ["decision_id"], :name => "index_choices_on_decision_id"

  create_table "criteria", :force => true do |t|
    t.string   "name"
    t.integer  "weight"
    t.integer  "decision_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "criteria", ["decision_id"], :name => "index_criteria_on_decision_id"

  create_table "decisions", :force => true do |t|
    t.string   "question"
    t.string   "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scores", :force => true do |t|
    t.integer  "value"
    t.integer  "choice_id"
    t.integer  "criterion_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "scores", ["choice_id"], :name => "index_scores_on_choice_id"
  add_index "scores", ["criterion_id"], :name => "index_scores_on_criterion_id"

end
