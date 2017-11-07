class RenameNpwsToCode < ActiveRecord::Migration
  def change
    rename_column :incidents, :npws, :code
  end
end
