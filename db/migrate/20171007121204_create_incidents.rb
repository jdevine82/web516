class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.integer :npws
      t.integer :officer
      t.text :reason
      t.date :whenfound
      t.text :wherefound

      t.timestamps null: false
    end
  end
end
