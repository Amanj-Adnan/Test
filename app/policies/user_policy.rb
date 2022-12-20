class UserPolicy < ApplicationPolicy
  # user = user.user
  def index?
    @user_workflow=UserWorkflow.find_by(workflow_manager:user.id)
    # user.id == record.line_manager_id || user.id == record.user.user_workflow.office.user_id
    if user.office != nil
      user.id == user.office.user_id || user.id == @user_workflow.workflow_manager
    elsif @user_workflow != nil
      user.id.to_i == @user_workflow.workflow_manager.to_i
      # user.id == user.line_manager.workflow_manager.to_i
    end
  end
end
