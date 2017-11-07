class Change < ActiveRecord::Migration
  def change
    rename_column :animals, :animals, :animalsname
  end
end
