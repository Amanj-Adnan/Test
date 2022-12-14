class RenamePermissionsCategories < ActiveRecord::Migration[7.0]
  def change
    rename_table :permissions_categories, :categories_permissions
  end
end
