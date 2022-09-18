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
    @new_super_user = SuperUser.new
    render "admin/super_users/new"
  end

  def create

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

end
