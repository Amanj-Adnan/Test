class UserPolicy < ApplicationPolicy
  def index?
    # user.id == record.line_manager_id || user.id == record.user.user_workflow.office.user_id
    if user.office != nil
      user.id == user.office.user_id || user.id == user.user_workflow.workflow_manager
    elsif user.line_manager != nil
      user.id == user.line_manager.workflow_manager.to_i
    end
  end
end
