class AttendanceController < ApplicationController
  before_action :authorized_admin
  layout('admin' )
  include Dummy
  def index
    if params[:query] && params[:query] !=''
      @attendance=Attendance.order(date: :desc).global_search(params[:query]).page(params[:page])
    else
      @attendance=Attendance.order(date: :desc).page(params[:page])
    end

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
    get_data["parameters"].each_with_index do |attendance,index|
      @user_id = get_data["parameters"][index]["user_id"]
      @date = get_data["parameters"][index]["date"]
      @clock_in = get_data["parameters"][index]["clock_in"]
      @clock_out = get_data["parameters"][index]["clock_out"]
      if check_date(@user_id,@date)
        next
      end
      Attendance.create(user_id:@user_id , date:@date ,clock_in:@clock_in ,clock_out:@clock_out )
    end
    redirect_to admin_attendance_path
  end


  def import

  end



  def export
    @attendance=Attendance.order(date: :desc).all

    respond_to do |format|
      format.csv{send_data @attendance.to_csv}
    end
  end

  private

  def check_date(user_id , date)
    @attendances = Attendance.find_by_sql "SELECT id FROM attendances WHERE date = '#{date}' AND user_id = '#{user_id}' "

    if  @attendances.length == 1
      return true
    else
      return false
    end
  end
  

end
