class AddPasswordDigestToOfficers < ActiveRecord::Migration
  def change
    add_column :officers, :password_digest, :string
  end
end
