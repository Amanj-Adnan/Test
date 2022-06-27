require 'active_support/core_ext'
class LeaveRequestsController < ApplicationController
  before_action :authenticate_user!
  layout('user' )


  def new
    @leave_request = LeaveRequest.new
  end

  def create
    @new_application= current_user.leave_requests.create!(application_params.merge(:pre_approve=>'accepted' , :approve=>'pending'))

    if @new_application.save
      redirect_to user_profile_path(current_user)
    else
      flash[:alert] = "Please fill all of inputs"
      redirect_back fallback_location:user_leave_application_path
    end
  end



  private


  def application_params
    params.require(:leave_request).permit(:line_manager_id,:hr_officer_id,:application_date,:leave_start_date,:leave_end_date,:leave_type,:reason,:certificate)
  end
end








# @date1=params[:leave_request][:leave_start_date].to_date
# @date2=params[:leave_request][:leave_end_date].to_date
# @time1=params[:leave_request][:leave_start_date].to_time
# @time2=params[:leave_request][:leave_end_date].to_time
# @application_type = params[:leave_request][:leave_type]
# @num_of_days=(@date2-@date1).to_i + 1
# @num_of_hours=((@time2 - @time1) / 1.hours).to_i
#
# if @application_type  =="annual_leave"
#   if @num_of_days == 1 && @num_of_hours <= 4
#     flash[:alert] = "please change application type to hourly leave ."
#   else
#
#   end
# elsif @application_type  =="sick_leave"
# elsif @application_type  =="maternity_leave"
# elsif @application_type  =="marriage_leave"
# elsif @application_type  =="paternity_leave"
# elsif @application_type  =="bereavement_leave"
# elsif @application_type  =="compensatory_off_leave"
# elsif @application_type  =="loss_of_pay_leave"
# elsif @application_type  =="hourly_leave"
# else
#
# end