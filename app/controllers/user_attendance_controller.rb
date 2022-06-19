class UserAttendanceController < ApplicationController
  before_action :authenticate_user!
  layout('user' )

  def show
    @attendance = current_user.attendances
    @user=current_user
    render "user_attendance/show"
  end
end
