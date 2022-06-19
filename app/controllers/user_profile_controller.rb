class UserProfileController < ApplicationController
  # before_action :set_user ,only: [:show,:show_attendance]
  before_action :authorized_admin ,only: [:new,:create]
  before_action :authenticate_user! ,only: [:show,]
  layout :choose_layout

  def choose_layout
    if action_name == 'show' || 'show_attendance'
      return 'user'
    else
      return 'admin'
    end
  end

  def new
    @user_email = User.without_user_profiles
    @user_profile=UserProfile.new
  end
  def show
    @user=current_user
    render "user_profile/show"
  end


  def create

    @new_user_profile = UserProfile.create!(user_info_params)
    if @new_user_profile.save
      redirect_to admin_users_path
    else
      flash[:alert] = "Please fill all of inputs"
      redirect_to new_user_profile_path
    end
  end



  private

  def user_info_params
    params.require(:user_profile).permit(:user_id,:avatar,:adress,:nmae,:date_of_berth,:start_date,:end_of_contarct,
                                         :monthly_salary,:educational_degree,:position,:working_country,:working_city,:working_office,:line_manager)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
