class AddRefToSuperUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :super_users, :role, index: true , :default => 0
    remove_column :roles ,:super_user_id
  end
end
