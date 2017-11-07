class CreateAnimals < ActiveRecord::Migration
 create_table "animals", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "nwpsid"
    t.text     "animalsname"
    t.text     "family"
    t.integer  "code"
  end
end
