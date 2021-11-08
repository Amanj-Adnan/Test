class RenameAdminUserToSuperUser < ActiveRecord::Migration[6.1]
  def change
    rename_table :admin_users, :super_users
  end
end

