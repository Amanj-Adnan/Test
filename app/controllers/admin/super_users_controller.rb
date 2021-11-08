class Admin::SuperUsersController <  ApplicationController
  before_action :authorized_admin
  layout('admin' )


  def index
    @super_users = SuperUser.all
    render "admin/super_users/index"
  end


end
