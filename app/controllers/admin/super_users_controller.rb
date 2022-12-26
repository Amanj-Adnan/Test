class Admin::SuperUsersController <  ApplicationController
  before_action :authorized_admin
  layout('admin' )


  def index
    # @current_admin = SuperUser.find_by(id:session[:admin_id])
    @admin = SuperUser.find_by!(id:session[:admin_id])
    @super_users = SuperUser.all
    authorize(@super_users)
    render "admin/super_users/index"
  end

  def edit
    @super_user = SuperUser.find_by(id:params[:admin_id])
    authorize(@super_user)
    @roles = Role.all
    @role = Role.find_by(id:@super_user.role_id).id
    render "admin/super_users/edit"
  end

  def update
    @user =  SuperUser.find_by!(id:params[:admin_id])
    authorize(@user)
    if @user.update(get_prams)
      redirect_to admin_super_users_path
    else
      flash[:alert] = "Something Went Wrong"
      redirect_to admin_super_users_edit_path(admin_id:params[:admin_id])
    end
  end


private

  def get_prams
    params.require(:super_user).permit(:email ,:password , :role_id)
  end


end
