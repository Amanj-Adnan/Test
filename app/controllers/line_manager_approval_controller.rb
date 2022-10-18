class LineManagerApprovalController < ApplicationController
  before_action :get_leave_request , only: [:approve ,:reject]
  before_action :get_reject_reason, only: [:reject]
  layout('user' )

  def index
    @requests=LeaveRequest.all
    @leave = LeaveRequest.first
    if @leave == nil
      redirect_back fallback_location: user_profile_show_path
    else
      authorize @leave
    end

  end
  def approve
    authorize @request

    puts(@request.aasm(:move).current_state)
    puts(@request.may_final_approve?)
    if @request.may_pre_approve?
      @state = @request.pre_approve!
      redirect_back fallback_location: user_leave_application_path
    elsif @request.may_final_approve?
      @state = @request.final_approve!
      @leave = @request
      @application_type = @leave.leave_type
      @date1 = @leave.leave_start_date.to_date
      @date2 = @leave.leave_end_date.to_date
      @time1 = @leave.leave_start_date.to_time
      @time2 = @leave.leave_end_date.to_time
      @num_of_days=(@date2-@date1).to_i + 1
      @num_of_hours=((@time2 - @time1) / 1.hours).to_i

      if @application_type  == "annual_leave"

        @new_balance = @leave.user.leave.annual_leave.to_i - @num_of_days
        if @leave.user.leave.update_attribute(:annual_leave,@new_balance)
          check_date
          flash[:alert] = "Leave application approved"
          redirect_back fallback_location:user_leave_application_path
        else
          flash[:alert] = "Something went Wrong"
          redirect_back fallback_location:user_leave_application_path
        end
      elsif @application_type  =="sick_leave"
        @new_balance = @leave.user.leave.sick_leave.to_i - @num_of_days
        if @leave.user.leave.update_attribute(:sick_leave,@new_balance)
          check_date
          flash[:alert] = "Leave application approved"
          redirect_back fallback_location:user_leave_application_path
        else
          flash[:alert] = "Something went Wrong"
          redirect_back fallback_location:user_leave_application_path
        end
      elsif @application_type  =="maternity_leave"
        @new_balance = @leave.user.leave.maternity_leave - @num_of_days
        if @leave.user.leave.update_attribute(:maternity_leave,@new_balance)
          check_date
          flash[:alert] = "Leave application approved"
          redirect_back fallback_location:user_leave_application_path
        else
          flash[:alert] = "Something went Wrong"
          redirect_back fallback_location:user_leave_application_path
        end
      elsif @application_type  =="marriage_leave"
        @new_balance = @leave.user.leave.marriage_leave - @num_of_days
        if @leave.user.leave.update_attribute(:marriage_leave,@new_balance)
          check_date
          flash[:alert] = "Leave application approved"
          redirect_back fallback_location:user_leave_application_path
        else
          flash[:alert] = "Something went Wrong"
          redirect_back fallback_location:user_leave_application_path
        end
      elsif @application_type  =="paternity_leave"
        @new_balance = @leave.user.leave.paternity_leave - @num_of_days
        if @leave.user.leave.update_attribute(:paternity_leave,@new_balance)
          check_date
          flash[:alert] = "Leave application approved"
          redirect_back fallback_location:user_leave_application_path
        else
          flash[:alert] = "Something went Wrong"
          redirect_back fallback_location:user_leave_application_path
        end
      elsif @application_type  =="bereavement_leave"
        @new_balance = @leave.user.leave.bereavement_leave - @num_of_days
        if @leave.user.leave.update_attribute(:bereavement_leave,@new_balance)
          check_date
          flash[:alert] = "Leave application approved"
          redirect_back fallback_location:user_leave_application_path
        else
          flash[:alert] = "Something went Wrong"
          redirect_back fallback_location:user_leave_application_path
        end


      elsif @application_type  =="compensatory_off_leave"
      elsif @application_type  =="loss_of_pay_leave"



      elsif @application_type  =="hourly_leave"
        if @leave.user.leave.hourly_leave < @num_of_hours
          @hours= 8
          @leave.user.leave.update_attribute(:hourly_leave,@hours)
          @new_balance = @leave.user.leave.hourly_leave - @num_of_hours
          if @leave.user.leave.update_attribute(:hourly_leave,@new_balance)
            @new_annual_balance = @leave.user.leave.annual_leave.to_i - 1
            @leave.user.leave.update_attribute(:annual_leave,@new_annual_balance)
            check_date
            flash[:alert] = "Leave application approved"
            redirect_back fallback_location:user_leave_application_path
          else
            flash[:alert] = "Something went Wrong"
            redirect_back fallback_location:user_leave_application_path
          end
        else
          @new_balance = @leave.user.leave.hourly_leave - @num_of_hours
          if @leave.user.leave.update_attribute(:hourly_leave,@new_balance)
            check_date
            flash[:alert] = "Leave application approved"
            redirect_back fallback_location:user_leave_application_path
          else
            flash[:alert] = "Something went Wrong"
            redirect_back fallback_location:user_leave_application_path
          end
        end
      else

      end
    end


  end

  def reject
    authorize @request
    if @request.may_reject?
      @state = @request.reject!
      @request.update_attribute(:reject_reason , @reason)
      redirect_back fallback_location:user_leave_application_path
    end
  end


  private

  def check_date

    @start_date = @request.leave_start_date.to_date
    @end_date = @request.leave_end_date.to_date
    @user_id = @request.user_id
    @type = @request.leave_type
    @attendance_last_date = Attendance.last.date

    (@start_date..@end_date).each do |day|
      if day <= @attendance_last_date
        # update attendance expetions
        @attendance = Attendance.find_by(user_id: @user_id ,date: day)
        @attendance.update_attribute(:exception, @type)
      else
        Attendance.new(:user_id=>@user_id,:date=>day,:exception=>@type)
      end
    end


  end

  def get_leave_request
    @request =LeaveRequest.find(params[:id])
  end

  def get_reject_reason
    @reason = params[:leave_request][:reject_reason]
  end

end
