class AttendanceController < ApplicationController
  before_action :authorized_admin
  layout('admin' )
  include Dummy
  def index
    @attendance=Attendance.order(date: :desc).all

    #
    # respond_to do |format|
    #   format.html
    #   format.csv{send_data  @attendance.to_csv}
    #   format.xlsx{send_data  @attendance.to_csv}
    # end

    respond_to do |format|
      format.xlsx {
        render 'admin/attendance/index'
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename= attendance.xlsx "
      }
      format.html { render 'admin/attendance/index' }

    end


  end

  def show

  end

  def new

  end

  def create
    hash = JSON.parse @dummy
    puts(hash)
  end


  def import

  end



  def export
    @attendance=Attendance.order(date: :desc).all

    respond_to do |format|
      format.csv{send_data @attendance.to_csv}
    end
  end
  

end
