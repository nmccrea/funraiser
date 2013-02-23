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

ActiveRecord::Schema.define(:version => 20130223223852) do

  create_table "donations", :force => true do |t|
    t.integer  "recipient_fundraiser_id"
    t.float    "amount"
    t.string   "donor_first_name"
    t.string   "donor_last_name"
    t.string   "donor_organization"
    t.text     "donor_message"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "fundraisers", :force => true do |t|
    t.integer  "owner_user_id"
    t.float    "fundraising_goal"
    t.float    "funds_raised"
    t.integer  "status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.text     "bio"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
