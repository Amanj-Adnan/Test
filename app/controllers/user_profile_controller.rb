class UserProfileController < ApplicationController
  before_action :set_user ,only: [:show]
  before_action :authorized_admin ,only: [:new,:create]
  before_action :authenticate_user! ,only: [:show]
  layout :choose_layout

  def choose_layout
    if action_name == 'show'
      return 'user'
    else
      return 'admin'
    end
  end
  def new
    @user_profile=UserProfile.new
  end
  def show
  end


  def create

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
