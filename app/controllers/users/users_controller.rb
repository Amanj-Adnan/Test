class Users::UsersController < ApplicationController
  before_action :authorized_admin
  layout('admin' )

  def index
    @users = User.all
    render "admin/users/index"
  end
end
