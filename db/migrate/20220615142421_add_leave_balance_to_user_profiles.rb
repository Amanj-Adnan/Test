class AddLeaveBalanceToUserProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :user_profiles, :leave_balance, :float
  end
end
