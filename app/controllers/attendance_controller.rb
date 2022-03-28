class AttendanceController < ApplicationController
  before_action :authorized_admin
  layout('admin' )
  def index
    render 'admin/attendance/index'
  end

  def show

  end

  def new

  end

  def create
    
  end
  

end
