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

ActiveRecord::Schema.define(version: 20150809134950) do

  create_table "collections", force: true do |t|
    t.time     "datetime"
    t.integer  "seed"
    t.string   "act"
    t.string   "world"
    t.string   "scene"
    t.string   "quest"
    t.integer  "quest_step"
    t.string   "location"
    t.string   "class_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "samples", force: true do |t|
    t.integer  "collection_id"
    t.time     "datetime"
    t.float    "fps"
    t.string   "batches"
    t.string   "tris"
    t.integer  "num_particle_systems"
    t.integer  "num_particles"
    t.float    "domino_step_ms"
    t.integer  "num_static_rigid_bodies"
    t.integer  "num_kinematic_rigid_bodies"
    t.integer  "num_dynamic_rigid_bodies"
    t.integer  "num_awake_bodies"
    t.string   "MainThreadbound"
    t.string   "GPUbound"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
