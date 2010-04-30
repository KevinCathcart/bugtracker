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

ActiveRecord::Schema.define(:version => 20100430214121) do

  create_table "bug_comments", :force => true do |t|
    t.text     "content"
    t.integer  "creator_id"
    t.integer  "bug_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bugs", :force => true do |t|
    t.string   "description"
    t.string   "see_also"
    t.integer  "status"
    t.integer  "severity"
    t.integer  "priority"
    t.integer  "duplicate_of_id"
    t.integer  "creator_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bugs_solutions", :id => false, :force => true do |t|
    t.integer "bug_id"
    t.integer "solution_id"
  end

  add_index "bugs_solutions", ["bug_id"], :name => "index_bugs_solutions_on_bug_id"
  add_index "bugs_solutions", ["solution_id"], :name => "index_bugs_solutions_on_solution_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solution_comments", :force => true do |t|
    t.text     "content"
    t.integer  "creator_id"
    t.integer  "solution_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", :force => true do |t|
    t.string   "description"
    t.string   "see_also"
    t.integer  "status"
    t.integer  "duplicate_of_id"
    t.integer  "creator_id"
    t.integer  "product_id"
    t.string   "patch_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "identifier"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["identifier"], :name => "index_users_on_identifier"

end
