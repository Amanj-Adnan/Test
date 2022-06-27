class LeaveController < ApplicationController
  before_action :authenticate_user!
  layout('user' )
  def index
    @user = current_user
    @leave_requests = @user.leave_requests
  end
end
