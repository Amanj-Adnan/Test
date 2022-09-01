class LineManagerApprovalController < ApplicationController
  layout('user' )

  def index
    @requests=LeaveRequest.all
    @leave = LeaveRequest.first
    authorize @leave
  end
  def approve

  end
end
