class  SuperUser::SuperUserController < ApplicationController
  before_action :authorized_admin

  layout('admin' )

  def index

  end

  def show

  end

  def edit

  end

  def new

    @roles = Role.all
    @new_super_user = SuperUser.new
    render "admin/super_users/new"
  end

  def create

    @new_super_user = SuperUser.create!(:email => params[:email] ,:password => params[:password],:role_id =>params[:role_id])

    if @new_super_user.save
      flash[:alert] = "Super user created"
      redirect_to admin_super_users_path
    else
      flash[:alert] = @new_super_user.errors
      redirect_back fallback_location:admin_create_super_user_path
    end


  end

  def update

  end

  def destroy

    if (user_signed_in?)
      session[:admin_id]=nil
      redirect_to root_path
    else
      session[:admin_id]=nil
      redirect_to root_path
    end
  end

  private


end
