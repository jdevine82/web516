class Modify < ActiveRecord::Migration
  def change
    remove_column :officers, :name
    add_column :officers, :first_name, :string
    add_column :officers, :last_name, :string
  end
end
