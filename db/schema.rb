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

ActiveRecord::Schema.define(:version => 20130427205639) do

  create_table "ec2_type_specifications", :force => true do |t|
    t.string   "name"
    t.string   "api_name"
    t.string   "api_type"
    t.string   "api_size"
    t.integer  "memory"
    t.integer  "compute_units"
    t.boolean  "support_32_bit"
    t.boolean  "support_64_bit"
    t.integer  "cores"
    t.string   "core_type"
    t.integer  "ephemeral_drives"
    t.integer  "total_ephemeral_storage"
    t.integer  "ebs_optimization"
    t.string   "io_performance"
    t.boolean  "spot_available"
    t.string   "notes"
    t.integer  "elastic_network_interfaces"
    t.integer  "private_ip_per_eni"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "ec2_type_specifications", ["api_name"], :name => "index_ec2_type_specifications_on_api_name", :unique => true

end
