class LineManagerApprovalController < ApplicationController
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

  end
end
