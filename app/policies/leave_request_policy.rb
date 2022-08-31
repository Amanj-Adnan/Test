class LeaveRequestPolicy < ApplicationPolicy
  def approve?
    user.id == record.line_manager_id
  end
end
