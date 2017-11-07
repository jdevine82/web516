class CreateOfficers < ActiveRecord::Migration
  create_table "officers", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
  end
end
