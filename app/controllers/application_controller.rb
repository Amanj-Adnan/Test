class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    if session[:admin_id]!=nil
      admin_users_path
    else
      user_profile_show_path(current_user.id)
    end

  end

  def pundit_user
    AdminContext.new(current_user,session[:admin_id])
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  private



  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end


  def authorized_admin
    if session[:admin_id] == nil
      redirect_to root_path
    elsif SuperUser.find_by(params[id: session[:admin_id] ])

      redirect_to request.fullpath unless request.fullpath == request.fullpath
    end
  end
end
