class Roles::RolesController < ApplicationController
  before_action :authorized_admin
  layout('admin' )

  def index

  end

  def show

  end

  def new
    @new_role =Role.new
    @permissions = Permission.all
    @countries = Country.all
    @cities = City.all
    @office = Office.all
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
