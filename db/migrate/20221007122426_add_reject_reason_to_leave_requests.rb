class AddRejectReasonToLeaveRequests < ActiveRecord::Migration[7.0]
  def change
    add_column 'leave_requests' , 'reject_reason' , 'text'
  end
end
