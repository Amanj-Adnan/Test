class LeaveRequestPolicy < ApplicationPolicy

  # def approve?
  #   user.id == record.line_manager_id || user.id == record.user.user_workflow.office.user_id
  # end

  def index?
    @user_workflow=UserWorkflow.find_by(workflow_manager:user.id)
    if user.office != nil
      user.id == user.office.user_id || user.id == user.user_workflow.workflow_manager
    elsif user.line_manager != nil
      user.id == user.line_manager.workflow_manager.to_i
    elsif user.id.to_i == @user_workflow.workflow_manager.to_i
      true
    end
  end

  def approve?
    if record.user.user_workflow.workflow_manager.to_i != nil  &&  user.id == record.user.user_workflow.workflow_manager.to_i && record.aasm(:move).current_state.to_s != 'rejected'
    record.aasm(:move).current_state.to_s == 'pending' &&  user.id == record.user.user_workflow.workflow_manager.to_i

    elsif record.user.user_workflow.office.user_id !=nil
    record.aasm(:move).current_state.to_s == 'pre_approved' &&  user.id == record.user.user_workflow.office.user_id.to_i && record.aasm(:move).current_state.to_s != 'rejected'
    else
      false
    end
  end

  def reject?
    if record.user.user_workflow.workflow_manager.to_i != nil  &&  user.id == record.user.user_workflow.workflow_manager.to_i && record.aasm(:move).current_state.to_s != 'rejected'
      record.aasm(:move).current_state.to_s == 'pending' &&  user.id == record.user.user_workflow.workflow_manager.to_i

    elsif record.user.user_workflow.office.user_id !=nil
      record.aasm(:move).current_state.to_s == 'pre_approved' &&  user.id == record.user.user_workflow.office.user_id.to_i && record.aasm(:move).current_state.to_s != 'rejected'
    else
      false
    end
  end
end
