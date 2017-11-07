class Modifyanimals < ActiveRecord::Migration
  def change
    remove_column :animals, :name
    remove_column :animals, :npws
    remove_column :animals, :family
    add_column :animals, :nwpsid, :number
    add_column :animals, :animals, :text
    add_column :animals, :family, :text
    add_column :animals, :code, :number
  end
end
