class RemoveRoleRefFromPermissions < ActiveRecord::Migration[7.0]
  def change
    remove_column :permissions, :role_id
  end
end
