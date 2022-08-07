

class SuperUser::SignInController <  ApplicationController

  def new
    render "super_users/sign_in/new"
  end

  def create
    @admin = SuperUser.find_by(email: params[:email])
    puts(@admin)
    if @admin.present?
      session[:admin_id] = @admin.id
      redirect_to admin_path
    else
      flash[:alert] = "Something went wrong please try again"
      render "super_users/sign_in/new"
    end
  end
end

