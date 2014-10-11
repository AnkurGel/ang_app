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

ActiveRecord::Schema.define(version: 20140211064811) do

  create_table "attachments", force: true do |t|
    t.string   "url"
    t.string   "kind"
    t.text     "summary"
    t.integer  "customer_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "communications", force: true do |t|
    t.text     "data"
    t.string   "from"
    t.integer  "case_id"
    t.string   "agent"
    t.string   "subject"
    t.boolean  "is_read",     default: false
    t.integer  "deal_id"
    t.integer  "customer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "to_field"
    t.text     "cc_field"
    t.text     "bcc_field"
  end

  add_index "communications", ["customer_id"], name: "index_communications_on_customer_id", using: :btree
  add_index "communications", ["deal_id"], name: "index_communications_on_deal_id", using: :btree
  add_index "communications", ["user_id"], name: "index_communications_on_user_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "domain"
    t.integer  "bs_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "discount"
    t.string   "kind"
  end

  create_table "deal_plans", force: true do |t|
    t.string   "name"
    t.string   "product"
    t.string   "plan_stage"
    t.integer  "discount"
    t.date     "purchase_date"
    t.integer  "payment_type"
    t.integer  "bs_invoice_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",        default: true
  end

  add_index "deal_plans", ["deal_id"], name: "index_deal_plans_on_deal_id", using: :btree

  create_table "deals", force: true do |t|
    t.string   "name"
    t.string   "deal_type"
    t.string   "stage",                          default: "new"
    t.string   "summary",           limit: 1024
    t.integer  "bs_group_id"
    t.string   "dashboard_link",    limit: 1024
    t.date     "closed_date"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activity_type"
    t.boolean  "activity_active",                default: false
    t.datetime "activity_date"
    t.date     "renewal_date"
    t.string   "deal_close_reason"
    t.date     "purchase_date"
    t.string   "payment_type"
    t.float    "amount"
    t.string   "domain"
    t.integer  "next_deal_id"
    t.string   "reseller_info"
    t.integer  "reseller_id"
  end

  add_index "deals", ["activity_active"], name: "index_deals_on_activity_active", using: :btree
  add_index "deals", ["activity_type"], name: "index_deals_on_activity_type", using: :btree
  add_index "deals", ["customer_id"], name: "index_deals_on_customer_id", using: :btree

  create_table "followups", force: true do |t|
    t.string   "email_id"
    t.integer  "follow_up_task_count"
    t.integer  "cycle_count"
    t.datetime "follow_up_date"
    t.integer  "deal_id"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "skype"
    t.integer  "bs_user_id"
    t.integer  "bs_group_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "owner",       default: false
    t.boolean  "admin",       default: false
  end

  add_index "users", ["customer_id"], name: "index_users_on_customer_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.string   "stage"
    t.string   "next_stage"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
