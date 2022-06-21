class ChangeLeaveToGender < ActiveRecord::Migration[6.1]
  def change
    change_column :user_profiles, :leave_balance, :string
    rename_column :user_profiles, :leave_balance, :gender
  end
end
