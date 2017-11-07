class CreateOfficers < ActiveRecord::Migration
  def change
    create_table :officers do |t|
      t.text :name
      t.integer :number

      t.timestamps null: false
    end
  end
end
