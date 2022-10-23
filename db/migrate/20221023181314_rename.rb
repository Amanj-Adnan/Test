class Rename < ActiveRecord::Migration[7.0]
  def change
    rename_table :roles_permissions, :permissions_roles
  end
end
