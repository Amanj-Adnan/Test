class UsersReportController < ApplicationController
  before_action :authorized_admin
  layout('admin' )

  def index
    @users = User.with_user_profiles.sort

  end

  def show
    @user = User.find_by(id: params[:user_id])
    @attendances = Attendance.where(user_id: params[:user_id]).to_a
    # @attendances =  Attendance.all.to_a
  end

  def monthly_report
    @user = User.find(params[:user_id])
     @new_date1  = "#{params[:month]}-01".to_date
     @new_date2  = "#{params[:month]}-31".to_date
     @attendances_date = Attendance.where(user_id: params[:user_id]).where(date: @new_date1..@new_date2)
    @date = DateTime.now.strftime("%m/%Y")
    @month = DateTime.new(2022,10)
    @days=[]

    (@month.day.to_i .. @month.to_date.end_of_month.day.to_i).each do |day|
      @days<<  DateTime.new(2022,10,day.to_i)
    end

    render 'users_report/monthly_report'
  end


  def print


    render 'users_report/monthly_report'
  end

end
