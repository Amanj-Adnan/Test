class ApproveController < ApplicationController
  before_action :authorized_admin
  before_action :set_application , only: [:approve,:reject]
  layout('admin' )
  def index
    @leave_applications = LeaveRequest.all
  end

  def approve

    @application_type = @leave.leave_type
    @date1 = @leave.leave_start_date.to_date
    @date2 = @leave.leave_end_date.to_date
    @time1 = @leave.leave_start_date.to_time
    @time2 = @leave.leave_end_date.to_time
    @num_of_days=(@date2-@date1).to_i + 1
    @num_of_hours=((@time2 - @time1) / 1.hours).to_i

    if @application_type  == "annual_leave"
    
      @new_balance = @leave.user.leave.annual_leave.to_i - @num_of_days
      if @leave.update_attribute(:approve,"accepted") && @leave.user.leave.update_attribute(:annual_leave,@new_balance)
        flash[:alert] = "Leave application approved"
        redirect_back fallback_location:admin_leave_applications_path
      else
        flash[:alert] = "Something went Wrong"
        redirect_back fallback_location:admin_leave_applications_path
      end
    elsif @application_type  =="sick_leave"
      @new_balance = @leave.user.leave.sick_leave.to_i - @num_of_days
      if @leave.update_attribute(:approve,"accepted") && @leave.user.leave.update_attribute(:sick_leave,@new_balance)
        flash[:alert] = "Leave application approved"
        redirect_back fallback_location:admin_leave_applications_path
      else
        flash[:alert] = "Something went Wrong"
        redirect_back fallback_location:admin_leave_applications_path
      end
    elsif @application_type  =="maternity_leave"
      @new_balance = @leave.user.leave.maternity_leave - @num_of_days
      if @leave.update_attribute(:approve,"accepted") && @leave.user.leave.update_attribute(:maternity_leave,@new_balance)
        flash[:alert] = "Leave application approved"
        redirect_back fallback_location:admin_leave_applications_path
      else
        flash[:alert] = "Something went Wrong"
        redirect_back fallback_location:admin_leave_applications_path
      end
    elsif @application_type  =="marriage_leave"
      @new_balance = @leave.user.leave.marriage_leave - @num_of_days
      if @leave.update_attribute(:approve,"accepted") && @leave.user.leave.update_attribute(:marriage_leave,@new_balance)
        flash[:alert] = "Leave application approved"
        redirect_back fallback_location:admin_leave_applications_path
      else
        flash[:alert] = "Something went Wrong"
        redirect_back fallback_location:admin_leave_applications_path
      end
    elsif @application_type  =="paternity_leave"
      @new_balance = @leave.user.leave.paternity_leave - @num_of_days
      if @leave.update_attribute(:approve,"accepted") && @leave.user.leave.update_attribute(:paternity_leave,@new_balance)
        flash[:alert] = "Leave application approved"
        redirect_back fallback_location:admin_leave_applications_path
      else
        flash[:alert] = "Something went Wrong"
        redirect_back fallback_location:admin_leave_applications_path
      end
    elsif @application_type  =="bereavement_leave"
      @new_balance = @leave.user.leave.bereavement_leave - @num_of_days
      if @leave.update_attribute(:approve,"accepted") && @leave.user.leave.update_attribute(:bereavement_leave,@new_balance)
        flash[:alert] = "Leave application approved"
        redirect_back fallback_location:admin_leave_applications_path
      else
        flash[:alert] = "Something went Wrong"
        redirect_back fallback_location:admin_leave_applications_path
      end
    
    
    elsif @application_type  =="compensatory_off_leave"
    elsif @application_type  =="loss_of_pay_leave"
    
    
    
    elsif @application_type  =="hourly_leave"
      if @leave.user.leave.hourly_leave < @num_of_hours
        @hours= 8
        @leave.user.leave.update_attribute(:hourly_leave,@hours)
        @new_balance = @leave.user.leave.hourly_leave - @num_of_hours
        if @leave.update_attribute(:approve,"accepted") && @leave.user.leave.update_attribute(:hourly_leave,@new_balance)
          @new_annual_balance = @leave.user.leave.annual_leave.to_i - 1
          @leave.user.leave.update_attribute(:annual_leave,@new_annual_balance)
          flash[:alert] = "Leave application approved"
          redirect_back fallback_location:admin_leave_applications_path
        else
          flash[:alert] = "Something went Wrong"
          redirect_back fallback_location:admin_leave_applications_path
        end
      else
        @new_balance = @leave.user.leave.hourly_leave - @num_of_hours
        if @leave.update_attribute(:approve,"accepted") && @leave.user.leave.update_attribute(:hourly_leave,@new_balance)
          flash[:alert] = "Leave application approved"
          redirect_back fallback_location:admin_leave_applications_path
        else
          flash[:alert] = "Something went Wrong"
          redirect_back fallback_location:admin_leave_applications_path
        end
      end
    else
    
    end
  end


  def reject

  end


  private

  def set_application
    @leave= LeaveRequest.find(params[:id])
  end
end
