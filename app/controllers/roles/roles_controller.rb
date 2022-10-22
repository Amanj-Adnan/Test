class Roles::RolesController < ApplicationController
  before_action :authorized_admin
  before_action :get_role_prams , only: [:create]
  layout('admin' )

  def index

  end

  def show

  end

  def new
    @new_role =Role.new
    @permissions = Permission.all
    @countries = Country.all
    @office = Office.all
    render "admin/roles/new"
  end

  def set_cities
    if params[:country_id] != ''
        @target = params[:target]
        @cities = Country.find(params[:country_id]).cities
        respond_to do |format|
          format.turbo_stream do
            render "admin/roles/set_cites"
          end
        end
    else
      @target = params[:target]
      @cities = {}
      respond_to do |format|
        format.turbo_stream do
          render "admin/roles/set_cites"
        end
      end
    end
  end

  def set_offices
    if params[:city_id] != ''
      @target = params[:target]
      @offices = City.find(params[:city_id]).offices
      respond_to do |format|
        format.turbo_stream do
          render "admin/roles/set_offices"
        end
      end
    else
      @target = params[:target]
      @offices = {}
      respond_to do |format|
        format.turbo_stream do
          render "admin/roles/set_offices"
        end
      end
    end
  end

  def edit

  end

  def create
    @permissions = params[:permissions].reject(&:empty?)
    @role = Role.create!(get_role_prams)
    @role_permissions = @role.roles_permissions.create(get_params)
    if @role_permissions.save
      redirect_to admin_create_role_path
    else
      render :new
    end

  end

  def update

  end

  def destroy

  end

  private

  def get_role_prams
    params.permit(:name , :country_id, :city_id,:office_id)
  end

end
