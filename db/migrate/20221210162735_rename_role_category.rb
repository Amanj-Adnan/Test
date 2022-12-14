class RenameRoleCategory < ActiveRecord::Migration[7.0]
  def change
    rename_table :roles_categories, :categories_roles
  end
end
