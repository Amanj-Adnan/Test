class CategoryPermissionsUpdate < ActiveRecord::Migration[7.0]
  def change
    drop_table :categories_permissions
    drop_table :permissions_roles
    drop_table :permissions


    rename_table :categories , :categories_permissions
  end
end
