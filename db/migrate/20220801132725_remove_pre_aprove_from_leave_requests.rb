class RemovePreAproveFromLeaveRequests < ActiveRecord::Migration[6.1]
  def change
    remove_column :leave_requests, :pre_approve, :string
  end
end
