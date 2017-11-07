class CreateIncidents < ActiveRecord::Migration
  create_table "incidents", force: :cascade do |t|
    t.integer  "code"
    t.integer  "officer"
    t.text     "reason"
    t.date     "whenfound"
    t.text     "wherefound"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
