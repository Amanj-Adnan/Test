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

  end
end
