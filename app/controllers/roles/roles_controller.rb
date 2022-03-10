class Roles::RolesController < ApplicationController
  before_action :authorized_admin
  layout('admin' )

  def index

  end

  def show

  end

  def new
    @new_role =Role.new
    render "admin/roles/new"
  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

end
