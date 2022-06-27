class AddDefaultToLeaveRequest < ActiveRecord::Migration[6.1]
  def change
    add_reference :leave_requests, :hr_officer, foreign_key: {to_table: :users}
    remove_column :leave_requests,:super_user_id
    change_column :leave_requests , :pre_approve,:string , :default =>"pending"
    change_column :leave_requests , :pre_approve,:string , :default =>"pending"
  end
end
