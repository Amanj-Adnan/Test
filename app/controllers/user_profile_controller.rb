class UserProfileController < ApplicationController
  # before_action :set_user ,only: [:show,:show_attendance]
  before_action :authorized_admin ,only: [:new,:create]
  before_action :authenticate_user! ,only: [:show,]
  layout :choose_layout

  def choose_layout
    if action_name == 'show'
      return 'user'
    else
      return 'admin'
    end
  end

  def new
    @user_email = User.without_user_profiles
    @user_profile=UserProfile.new
    @countries = Country.all
  end
  def show
    @user=current_user
    render "user_profile/show"
  end


  def create
    @new_user_profile = UserProfile.create!(user_info_params)
    @contract_duration = (params[:user_profile][:end_of_contarct].to_date.year * 12 + params[:user_profile][:end_of_contarct].to_date.month) - (params[:user_profile][:start_date].to_date.year * 12 + params[:user_profile][:start_date].to_date.month)
    if params[:user_profile][:gender] == "female"
      @annual_leave= (@contract_duration * 1.75).to_i
      @sick_leave = @contract_duration * 0.5
      @user_id =  params[:user_profile][:user_id]
      @hourly_leave=(((@contract_duration * 1.75)%1) * 24).to_i
      @leave = Leave.create!(:user_id => @user_id ,:annual_leave => @annual_leave ,:sick_leave => @sick_leave,:maternity_leave=>60,
                             :marriage_leave=>5,:paternity_leave=>0,:bereavement_leave=>2,:compensatory_off_leave=>0,:loss_of_pay_leave=>0,:hourly_leave=>@hourly_leave)
    else
      @annual_leave= (@contract_duration * 1.75).to_i
      @sick_leave = @contract_duration * 0.5
      @user_id =  params[:user_profile][:user_id]
      @hourly_leave=(((@contract_duration * 1.75)%1) * 24).to_i
      @leave = Leave.create!(:user_id => @user_id ,:annual_leave => @annual_leave ,:sick_leave => @sick_leave,:maternity_leave=>0,
                             :marriage_leave=>5,:paternity_leave=>2,:bereavement_leave=>2,:compensatory_off_leave=>0,:loss_of_pay_leave=>0,:hourly_leave=>@hourly_leave)
    end

    if @new_user_profile.save && @leave.save
      redirect_to admin_users_path
    else
      flash[:alert] = "Please fill all of inputs"
      redirect_to new_user_profile_path
    end
  end



  private

  def user_info_params
    params.require(:user_profile).permit(:user_id,:avatar,:adress,:nmae,:date_of_berth,:start_date,:end_of_contarct,
                                         :monthly_salary,:educational_degree,:position,:working_country,:working_city,:working_office,:line_manager,:gender)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
